#-------------------------------------------------------------------------------
#------------------------------- Standardization -------------------------------
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
nhefs_full <- read.csv('nhefs.csv')

# For simplicity, we will ignore missingness in the outcome (weight gain, wt82_71)
nhefs <- nhefs_full[which(!is.na(nhefs_full$wt82_71)),]

#------------------------------------------
#--- (1) Non-parametric standardization ---
#------------------------------------------
# Relevant variables: 
#  - Treatment (A): smoking cessation (qsmk)
#  - Outcome (Y): weight gain (wt82_71)
#  - Covariates (L): exercise (exercise)
#------------------------------------------

# We will start by using non-parametric standardization to estimate marginal 
# causal effects. We will need to calculate the distribution of L, Pr[L=l], and
# the conditional means for the outcome, E[Y|A=a, L=l]

# Distribution of L:
table(nhefs[,"exercise"])    
prop.table(table(nhefs[,"exercise"]))

  # Saving values
  Pr_L0 <- prop.table(table(nhefs[,"exercise"]))[1]
  Pr_L0
  Pr_L1 <- prop.table(table(nhefs[,"exercise"]))[2]
  Pr_L1
  Pr_L2 <- prop.table(table(nhefs[,"exercise"]))[3]
  Pr_L2

# Conditional means for the outcome
  # Note: code is provided to estimate the conditional means in the much 
  # exercise treated (L=0, A=1) stratum, and in the much exercise untreated 
  # (L=0, A=0) stratum. Modify the code in order to estimate the means in the
  # remaining strata. 

  # L=0, A=1
  E_Y_L0A1 <- mean(nhefs[which(nhefs$exercise==0 & nhefs$qsmk==1),]$wt82_71)
  E_Y_L0A1
  
  # L=1, A=1
  E_Y_L1A1 <- mean(nhefs[which(nhefs$exercise==1 & nhefs$qsmk==1),]$wt82_71)
  E_Y_L1A1  
  
  # L=2, A=1
  E_Y_L2A1 <- # Modify the code above to calculate E[Y|L=2,A=1]
  E_Y_L2A1    
  
  # --------------------------
  
  # L=0, A=0
  E_Y_L0A0 <- mean(nhefs[which(nhefs$exercise==0 & nhefs$qsmk==0),]$wt82_71)
  E_Y_L0A0
  
  # L=1, A=0
  E_Y_L1A0 <- # Modify the code above to calculate E[Y|L=1,A=0]
  E_Y_L1A0   
  
  # L=2, A=0
  E_Y_L2A0 <- # Modify the code above to calculate E[Y|L=2,A=0]
  E_Y_L2A0 
  

# Computing the marginal means

  # For A=1
  Y_a1 <- Pr_L0*E_Y_L0A1 + # fill in the remaining equation based on the values you calculated above
  Y_a1
  
  # For A=0
  Y_a0 <- Pr_L0*E_Y_L0A0 + # fill in the remaining equation based on the values you calculated above
  Y_a0  
  
# Computing the marginal effect
Y_a1 - Y_a0  
  
  
#---------------------------------------------------------------
#--- (2) Parametric standardization for a continuous outcome ---
#---------------------------------------------------------------
# Relevant variables: 
#  - Treatment (A): smoking cessation (qsmk)
#  - Outcome (Y): weight gain (wt82_71)
#  - Covariates (L): exercise (exercise), age (age), age-squared, sex (sex), 
#                    education (education)
#---------------------------------------------------------------

# Step 1: Expansion of the dataset

  # Copy 1: set all values of treatment to 1
  nhefs1 <- nhefs
  nhefs1$qsmk <- 1
  
  # Copy 2: set all values of treatment to 0
  nhefs0 <- nhefs
  nhefs0$qsmk <- 0

# Step 2: Outcome modeling
lin.mod <- lm(wt82_71~qsmk + as.factor(exercise) + age + I(age^2) + 
  sex + as.factor(education), data=nhefs)
summary(lin.mod)  
  
# Step 3: Prediction
nhefs1$predict.y <- predict(lin.mod, newdata=nhefs1, type="response")
nhefs0$predict.y <- predict(lin.mod, newdata=nhefs0, type="response")

# Step 4: Standardization by averaging
mean(nhefs1$predict.y)
mean(nhefs0$predict.y)


#----------------------------------------------------------------
#--- (3) Parametric standardization for a dichotomous outcome ---
#----------------------------------------------------------------
# Relevant variables: 
#  - Treatment (A): smoking cessation (qsmk)
#  - Outcome (Y): death (death)
#  - Covariates (L): exercise (exercise), age (age), age-squared, sex (sex), 
#                    education (education)
#----------------------------------------------------------------

# Step 1: Expansion of the dataset

  # Copy 1: set all values of treatment to 1



  # Copy 2: set all values of treatment to 0




# Step 2: Outcome modeling




# Step 3: Prediction




# Step 4: Standardization by averaging




#------------------------------------------------------
#--- (4) Bootstrapping for 95% confidence intervals ---
#------------------------------------------------------
# Relevant variables: 
#  - Treatment (A): smoking cessation (qsmk)
#  - Outcome (Y): weight gain (wt82_71)
#  - Covariates (L): exercise (exercise), age (age), age-squared, sex (sex), 
#                    education (education)
#---------------------------------------------------------------

# We can use a 'for loop' to calculate bootstrapped 95% confidence intervals.
# Let's do this for the effect of smoking cessation on weight gain. A reminder
# that the effect estimate we obtained was 3.178 kg.

# Specify the number of bootstraps we would like to do. In general, you should
# do at least 500 bootstraps, but a minimum of 1,000 is ideal. 
num.boot <- 1000

# Here we will create a seed for each bootstrap sample. Setting a seed allows 
# for reproducibility of the analysis. It will  select the same random bootstrap
# sample each time so that we always get the same results.
set.seed(12345)
seed <- floor(runif(num.boot)*10^8)

# Now we will create an empty dataset that will eventually store all of our
# results from the bootstrapped samples. We want the dataset to have 3 columns
# (one for the mean outcome under treatment, one for the mean outcome under no
# treatment, and one for the difference in the means). Since we're doing 1,000
# bootstraps, we want 1,000 rows. 
boot.results <- data.frame(mean_qsmk0=rep(NA, num.boot),
                           mean_qsmk1=rep(NA, num.boot),
                           mean_difference=rep(NA, num.boot))
  
# Now we'll start the 'for loop'. Here we specify a variable i, that will loop
# through the values from 1 to num.boot (i.e. to 1000). Each time it loops, it 
# will run through the code that's provided between the curly brackets.


for (i in 1:num.boot){
  # First set the seed for this bootstrap sample. It will take the i-th value
  # in the seed vector that we created earlier
  set.seed(seed[i])
  
  # We create a vector of the row numbers that will get selected into our
  # bootstrap sample. Notice that the size of the  sample is the same as the 
  # original dataset, and that we are sampling with replacement.
  sample.row <- sample(nrow(nhefs), size=nrow(nhefs), replace=T)
  
  # Next, we pull the selected rows from the original nhefs dataset
  nhefs.boot <- nhefs[sample.row,]
  
  # Now we do the standardization analysis in the bootstrapped sample:
  
    # Step 1: Expansion of the dataset
      nhefs.boot1 <- nhefs.boot
      nhefs.boot1$qsmk <- 1
      
      nhefs.boot0 <- nhefs.boot
      nhefs.boot0$qsmk <- 0
    
    # Step 2: Outcome modeling
    lin.mod <- lm(wt82_71~qsmk + as.factor(exercise) + age + I(age^2) + 
      sex + as.factor(education), data=nhefs.boot)
    summary(lin.mod)  
    
    # Step 3: Prediction
    nhefs.boot1$predict.y <- predict(lin.mod, newdata=nhefs.boot1, type="response")
    nhefs.boot0$predict.y <- predict(lin.mod, newdata=nhefs.boot0, type="response")
    
  # Last, we store the results into the boot.results dataset
  boot.results[i, "mean_qsmk1"] <- mean(nhefs.boot1$predict.y)
  boot.results[i, "mean_qsmk0"] <- mean(nhefs.boot0$predict.y)
  boot.results[i, "mean_difference"] <- mean(nhefs.boot1$predict.y)-mean(nhefs.boot0$predict.y)
  
  # Now that we have reached the end of the code, R will go back to the 
  # beginning of the loop and perform this all over again with i+1
}

# Let's take a look at the results
View(boot.results)

# Now, we take the 2.5th and 97.5th percentiles to obtain the limits of the 
# confidence intervals
quantile(boot.results$mean_difference, probs=c(0.025, 0.975))
  