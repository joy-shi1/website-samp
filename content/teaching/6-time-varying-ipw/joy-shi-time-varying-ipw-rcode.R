#-------------------------------------------------------------------------------
#--------------------- IPW with time-varying treatments ------------------------
#-------------------------------------------------------------------------------
#
# Date: February 25, 2022
# Written by: Joy Shi
# 
#-------------------------------------------------------------------------------

#-----------------------------
#--- (0) Importing dataset ---
#-----------------------------

# We will apply IPW to time-varying data on antidepressant use and birth weight.
# (Note that this data is simulated.)

# The variables in the dataset include:
#  - id: Participant ID number
#  - antidep0: Anti-depressant use during the 2nd trimester
#              (1 - yes; 0 - no)
#  - antidep1: Anti-depressant use during the 3rd trimester
#              (1 - yes; 0 - no)
#  - birthweight: Infant birth weight (in grams) 
#  - age: Age of the birthing parent
#  - education: Education level of the birthing parent
#               (1 - some high school; 2 - completed high school; 
#               3 - some college; 4 - college or higher)
#  - urban: Urban-rural classification of the birthing parent's residence
#           (1 - rural; 0 - Urban)
#  - alone: Does the birthing parent live alone?
#           (1 - yes; 0 - no)
#  - smoking: Smoking status of the birthing parent
#             (1 - non-smoker; 2 - current smoker; 3 - former smoker)
#  - anxiety: Birthing parent history of anxiety
#             (1 - yes; 0 - no)
#  - asthma: Birthing parent history asthma
#            (1 - yes; 0 - no)
#  - depscore0: Depression score (based on the CES-D scale) at start 
#               of the 2nd trimester
#  - depscore1: Depression score (based on the CES-D scale) at start 
#               of the 3rd trimester
#  - hypertension0: Birthing parent hypertension status at start of 2nd trimester
#                   (1 - yes; 0 - no)
#  - hypertension1: Birthing parent hypertension status at start of 2nd trimester
#                   (1 - yes; 0 - no)

# Remember to change the directory here, depending on where you saved the example
# dataset
setwd('CHANGE DIRECTORY')

# Importing the ipw_example dataset
ipw_example <- read.csv('ipw_example.csv')

#--------------------------------------------
#--- (1) Calculating unstabilized weights ---
#--------------------------------------------
# Relevant variables: 
#  - Treatment at time 0 (A0): antidep0
#  - Treatment at time 1 (A1): antidep1
#  - Confounders at time 0 (L0): age, education, urban, alone, smoking, anxiety,
#    asthma, depscore0, hypertension0
#  - Confounders at time 1 (L1): depscore1, hypertension1
#--------------------------------------------

# To calculate the denominator of the weights at time 0, we need to fit the 
# following model:
#   logit Pr[A0 = 1 | L0] = b0 + b1*L0

denom.model0 <- glm(antidep0~age + as.factor(education) + urban + alone + 
                      as.factor(smoking) + anxiety + asthma + depscore0 + 
                      hypertension0,
                    data=ipw_example,
                    family="binomial")

summary(denom.model0)

# We can obtain the predicted values based on this model. Remember to specify
# the 'type="response"' option to obtain predicted probabilities (otherwise
# you will obtain the predicted log odds).
predict_denom.model0 <- predict(denom.model0, type="response")


# To calculate the denominator of the weights at time 1, we need to fit the 
# following model:
#   logit Pr[A1 = 1 | L1, A0, L0] = b0 + b1*L1 + b2*A0 + b3*L0

denom.model1 <- glm(antidep1~hypertension1 + depscore1 + # L1 confounders
                      antidep0 + # A0
                      age + as.factor(education) + urban + alone + # L0 confounders
                      as.factor(smoking) + anxiety + asthma + depscore0 + 
                      hypertension0,
                    data=ipw_example,
                    family="binomial")

# We can obtain the predicted values based on this model:
predict_denom.model1 <- predict(denom.model0, type="response")

# To calculate the weights at time 0, remember that they are equal to 
#    1/predict_denom0 if A0 = 1
#    1/(1-predict_denom0) if A0 = 0

w0 <- ifelse(ipw_example$antidep0==1, 1/predict_denom.model0, 1/(1-predict_denom.model0))
mean(w0) # Mean is approximately 2, as expected

# To calculate the weights at time 1, remember that they are equal to 
#    1/predict_denom1 if A1 = 1
#    1/(1-predict_denom1) if A1 = 0

w1 <- ifelse(ipw_example$antidep1==1, 1/predict_denom.model1, 1/(1-predict_denom.model1))
mean(w1) # Mean is approximately 2, as expected

# To obtain the overall weights, we multiple w0 and w1 together
w <- w0*w1

  
#---------------------------------------------------
#--- (2) Outcome model with unstabilized weights ---
#---------------------------------------------------
# Relevant variables: 
#  - Treatment at time 0 (A0): antidep0
#  - Treatment at time 1 (A1): antidep1
#  - Outcome (Y): birthweight
#  - Unstabilized weights: w
#---------------------------------------------------

# To fit the outcome model, we're going to need to use the "geepack" package.
install.packages('geepack')
library('geepack')
# The 'geepack' package includes a function called geeglm, which will 
# automatically calculate robust standard errors for us. The syntax for
# geeglm is identical to the syntax for glm, except you have to specify 
# what variable represents the id.

# Let's fit the saturated/non-parametric outcome model first:
#  E[Y | A0, A1] = b0 + b1*A0 + b2*A1 + b3*A0*A1
saturated.outcome.w <- geeglm(birthweight ~ antidep0 + antidep1 + 
                                antidep0*antidep1,
                              data=ipw_example, weights=w, id=id)

summary(saturated.outcome.w)

# Coefficients:
#                     Estimate  Std.err     Wald Pr(>|W|)    
#   (Intercept)       3425.578    8.046 181261.0  < 2e-16 ***
#   antidep0           -58.804   15.922     13.6  0.00022 ***
#   antidep1          -138.627   15.954     75.5  < 2e-16 ***
#   antidep0:antidep1   -0.883   47.616      0.0  0.98521   

# Notice that the interaction term is very close to 0 (-0.883). This suggests
# that we don't have interaction between A0 and A1, and we could fit an
# unsaturated/parametric outcome model instead:
#  E[Y | A0, A1] = b0 + b1*A0 + b2*A1

unsaturated.outcome.w <- geeglm(birthweight ~ antidep0 + antidep1,
                           data=ipw_example, weights=w, id=id)

summary(unsaturated.outcome.w)

# Coefficients:
#               Estimate Std.err    Wald Pr(>|W|)    
#   (Intercept)   3425.8    14.2 58047.0  < 2e-16 ***
#   antidep0       -59.3    26.0     5.2    0.023 *  
#   antidep1      -139.1    25.2    30.4  3.5e-08 ***


#--------------------------------------------
#--- (3) Calculating stabilized weights ---
#--------------------------------------------
# Relevant variables: 
#  - Treatment at time 0 (A0): antidep0
#  - Treatment at time 1 (A1): antidep1
#  - Confounders at time 0 (L0): age, education, urban, alone, smoking, anxiety,
#    asthma, depscore0, hypertension0
#  - Confounders at time 1 (L1): depscore1, hypertension1
#--------------------------------------------

# We've already calculated the denominators in Part (1). Now we just need to
# calculate the numerators for the weights.

# The model for the numerator of the weights at time 0 is:
#  logit Pr[A0 = 1] = b0
num.model0 <- glm(antidep0~1, data=ipw_example, family="binomial")
summary(num.model0)
predict_num.model0 <- predict(num.model0, type="response")

# The model for the numerator of the weights at time 1 is:
#  logit Pr[A1 = 1 | A0] = b0 + b1*A0
num.model1 <- glm(antidep1~antidep0, data=ipw_example, family="binomial")
summary(num.model1)
predict_num.model1 <- predict(num.model1, type="response")

# To calculate the stabilized weights at time 0, remember that they are equal to 
#    predict_num0 / predict_denom0 if A0 = 1
#    (1-predict_num0) / (1-predict_denom0) if A0 = 0

sw0 <- ifelse(ipw_example$antidep0==1, predict_num.model0/predict_denom.model0, 
              (1-predict_num.model0)/(1-predict_denom.model0))
mean(sw0) # Mean is approximately 1, as expected

# To calculate the weights at time 1, remember that they are equal to 
#    predict_num1 / predict_denom1 if A1 = 1
#    (1-predict_num1) / (1-predict_denom1) if A1 = 0

sw1 <- ifelse(ipw_example$antidep1==1, predict_num.model1/predict_denom.model1, 
             (1-predict_num.model1)/(1-predict_denom.model1))
mean(sw1) # Mean is approximately 1, as expected

# To obtain the overall weights, we multiple sw0 and sw1 together
sw <- sw0*sw1


#-------------------------------------------------
#--- (3) Outcome model with stabilized weights ---
#-------------------------------------------------
# Relevant variables: 
#  - Treatment at time 0 (A0): antidep0
#  - Treatment at time 1 (A1): antidep1
#  - Outcome (Y): birthweight
#  - Stabilized weights: sw
#-------------------------------------------------

# The saturated/non-parametric outcome model with stabilized weights:
#  E[Y | A0, A1] = b0 + b1*A0 + b2*A1 + b3*A0*A1
saturated.outcome.sw <- geeglm(birthweight ~ antidep0 + antidep1 + 
                                 antidep0*antidep1,
                              data=ipw_example, weights=sw, id=id)

summary(saturated.outcome.sw)

# Coefficients:
#                     Estimate  Std.err     Wald Pr(>|W|)    
#   (Intercept)       3425.578    8.046 181261.0  < 2e-16 ***
#   antidep0           -58.804   15.922     13.6  0.00022 ***
#   antidep1          -138.627   15.954     75.5  < 2e-16 ***
#   antidep0:antidep1   -0.883   47.616      0.0  0.98521   

# Notice that we get exactly the same results as when we used unstabilized
# weights. That is because this model is saturated/non-parametric. 

# Now, let's fit the unsaturated/non-parametric outcome model
#  E[Y | A0, A1] = b0 + b1*A0 + b2*A1

unsaturated.outcome.sw <- geeglm(birthweight ~ antidep0 + antidep1,
                                data=ipw_example, weights=sw, id=id)

summary(unsaturated.outcome.sw)

# Coefficients:
#               Estimate Std.err     Wald Pr(>|W|)    
#   (Intercept)  3425.64    8.17 1.76e+05  < 2e-16 ***
#   antidep0      -59.17   20.72 8.16e+00   0.0043 ** 
#   antidep1     -138.96   19.53 5.06e+01  1.1e-12 ***

# Notice that the estimates are approximately the same as when we used
# unstabilized weights, but the standard errors are much smaller!
#  - 14.2 vs. 8.17 for b0
#  - 26.0 vs. 20.72 for b1
#  - 25.2 vs. 19.53 for b2

