#-------------------------------------------------------------------------------
#----------------------- Instrumental Variable Estimation ----------------------
#-------------------------------------------------------------------------------
#
# Written by: Joy Shi
#
#-------------------------------------------------------------------------------

#-----------------------------
#--- (0) Importing dataset ---
#-----------------------------

# Remember to change the directory here, depending on where you saved the NHEFS
# dataset
setwd('SPECIFY DIRECTORY HERE')

# Importing NHEFS dataset
nhefs <- read.csv('nhefs.csv')

# For simplicity, we will remove observations that have missing data on 
# the instrument (price) and missing data on the outcome (weight gain).
nhefs.iv <- nhefs[which(!is.na(nhefs$price82) & !is.na(nhefs$wt82_71)),] 


#-----------------------------------
#--- (1) Creating our instrument ---
#-----------------------------------

# As our instrument, we'll be using the price of cigarettes in 1982 (price82).
# However, first, we need to dichotomize it to price82 > 1.50 and 
# price82 <= 1.50. We'll create a new variable in the NHEFS dataset for this, 
# and we'll call it highprice:

nhefs.iv$highprice <- ifelse(nhefs.iv$price82>1.50, 1, 0)
table(nhefs.iv$highprice)

#---------------------------------------------------------
#--- (2) IV estimation using the standard IV estimator ---
#---------------------------------------------------------
# Relevant variables: 
#  - Instrument (Z): price of cigarettes (highprice)
#  - Treatment (A): smoking cessation (qsmk)
#  - Outcome (Y): weight gain (wt82_71)
#---------------------------------------------------------

# Remember that our IV estimator is the ITT effect divided by the level of
# adherence:
#
#          (E[Y|Z=1] - E[Y|Z=0])  /  (E[A|Z=1] - E[A|Z=0])
#

# a. Let's start by calculating the numerator:

iv.num <- mean(nhefs.iv[which(nhefs.iv$highprice==1),]$wt82_71) - 
          mean(nhefs.iv[which(nhefs.iv$highprice==0),]$wt82_71)

iv.num # This is the effect of cigarette price on weight gain


# b. Now let's calculate the denominator:

iv.den <- mean(nhefs.iv[which(nhefs.iv$highprice==1),]$qsmk) - 
          mean(nhefs.iv[which(nhefs.iv$highprice==0),]$qsmk)


iv.den # This is the effect of cigarette price on quitting smoking.  


# c. Now we divide the numerator by the denominator:
iv.num / iv.den

# Now we have our IV estimate! This is the effect of quitting smoking on 
# weight gain.

#-------------------------------------------------------
#--- (3) IV estimation using two-stage least squares ---
#-------------------------------------------------------
# Relevant variables: 
#  - Instrument (Z): price of cigarettes (highprice)
#  - Treatment (A): smoking cessation (qsmk)
#  - Outcome (Y): weight gain (wt82_71)
#-------------------------------------------------------

# In practice, people use a method called two-stage least squares. In the case
# of a dichotomous instrument and a dichotomous treatment, the two-stage least
# squares estimator is equivalent to the ratio method that we did in part (2).
# However, the two-stage least squares estimator is more flexible, because it:
#  - Can handle continuous treatments
#  - Can handle continuous instruments
#  - Can handle multiple instruments
#  - Provides 95% confidence intervals
#
# To perform two-stage least squares, we'll need to install a package called 
# sem:

install.packages('sem')
library('sem')

# The two-stage least squares estimator runs two regression models back-to-back:
#  1) Model 1: Regress the treatment (qsmk) on the instrument (highprice)
#  2) Model 2: Regress the outcome (wt82_71) on the predicted values from model 1
# The tsls function will do all of this. In the tsls function, we specify
# model 2 first (outcome~treatment), and then we specify model 1 (~instrument).

iv.model <- tsls(wt82_71~qsmk, ~highprice, data=nhefs.iv)
summary(iv.model)

# Notice that our IV estimate here, 2.40, is exactly the same as what we 
# obtained in Part (2). However, we can also obtained 95% confidence intervals
# for this estimate:

confint(iv.model)

# Therefore, our result is: 2.40 (95% CI: -36.5, 41.3). Notice how wide those
# confidence intervals are!

# Let's see what we get if we use other cut-offs for the price of cigarettes:
tsls(wt82_71~qsmk, ~I(price82>1.6), data=nhefs.iv)
tsls(wt82_71~qsmk, ~I(price82>1.7), data=nhefs.iv)
tsls(wt82_71~qsmk, ~I(price82>1.8), data=nhefs.iv)
tsls(wt82_71~qsmk, ~I(price82>1.9), data=nhefs.iv)
tsls(wt82_71~qsmk, ~I(price82>2.0), data=nhefs.iv)



#----------------------------------------------------------------
#--- (4) Adjusted IV estimation using two-stage least squares ---
#----------------------------------------------------------------
# Relevant variables: 
#  - Instrument (Z): price of cigarettes (highprice)
#  - Treatment (A): smoking cessation (qsmk)
#  - Outcome (Y): weight gain (wt82_71)
#  - Covariates (L): age, sex, exercise, education
#----------------------------------------------------------------

# If we are concerned about instrument-outcome confounders, we can adjust
# for them in our analysis if we have measured them. We can do this using
# the same two-stage least squares estimator that we used in part (3). 
# Recall that when we do two-stage least squares, the function runs two
# models: one for the treatment (conditional on the instrument) and one for 
# the outcome (conditional on predicted values of treatment from model 1).
# When we adjust for covariates, we need to include the covariates in BOTH
# of those sets of models. When we use the tsls function, we indicate this
# by specifying the covariates twice.


iv.adjmodel <- tsls(wt82_71~qsmk+age+sex+as.factor(exercise)+as.factor(education), 
                 ~highprice+age+sex+as.factor(exercise)+as.factor(education),
                 data=nhefs.iv)

summary(iv.adjmodel)


#-----------------------------------------
#--- (5) F-statistic of the instrument ---
#-----------------------------------------
# Relevant variables: 
#  - Instrument (Z): price of cigarettes (highprice)
#  - Treatment (A): smoking cessation (qsmk)
#  - Outcome (Y): weight gain (wt82_71)
#------------------------------------------


# Let's check for the strength of the association between our instrument and
# our exposure. Recall that the denominator of the standard IV estimator 
# represents the magnitude of the association:

iv.den

# The probability of quitting smoking is 6 percentage points higher among
# people with high cigarette prices (>$1.50) compared to people with low
# cigarette prices (=<$1.50)

# Now let's check the F-statistic between our instrument and our exposure. 
# First we run a regression model for the exposure on the instrument:

iv.fstat <- lm(qsmk~highprice, data=nhefs.iv)

# Then we can pull out the f-statistic by using the anova command:

anova(iv.fstat)

# We can see that the f-value is 0.822, which is very low.

#----------------------------------
#--- (6) IV with Selection Bias ---
#----------------------------------
# Relevant variables: 
#  - Instrument (Z): price of cigarettes (highprice)
#  - Treatment (A): smoking cessation (qsmk)
#  - Outcome (Y): weight gain (wt82_71)
#  - Factors related to selection (L): sex, race, age, age^2, education, 
#    exercise, active
#------------------------------------------

# Before, we ignored missingness in the outcome by dropping observations 
# with missing data on weight gain. Now, let's use the full NHEFS dataset but
# for simplicity, we'll still ignore missingness in the instrument. We will
# also have to recreate our instrument (dichotomize price at 1.50) in this 
# new dataset

nhefs <- read.csv('nhefs.csv')
nhefs <- nhefs[which(!is.na(nhefs$price82)),]
nhefs$highprice <- ifelse(nhefs$price82>1.50, 1, 0)

# Now, let's create an indicator variables for censoring
nhefs$censored <- ifelse(is.na(nhefs$wt82_71), 1, 0)
table(nhefs$censored)

# Next, we fit a model for the denominator of the IP censoring weights
cens.model <- glm(censored==0 ~ qsmk + sex + race + age + I(age^2) + 
  as.factor(education) + as.factor(exercise) + as.factor(active), 
  data=nhefs, family=binomial)
summary(cens.model)

# Once we have fit the model, we can use it to generate predicted probabilities
# of not being censored conditional on A and L. From the predicted 
# probabilities, we can calculate the unstabilized censoring weights.
nhefs$predicted_c <- predict(cens.model, type="response")
nhefs$w_cens <- 1/nhefs$predicted_c

# Now, we can use these weights in our tsls function to account for selection
# bias. Note that we can obtain the IV estimate from the tsls function but the
# standard error (and 95% confidence intervals) will be wrong because it does
# not give us robust standard errors
iv.model.cens <- tsls(wt82_71~qsmk, ~highprice, data=nhefs, weights=w_cens)
summary(iv.model.cens)
