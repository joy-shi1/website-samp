---
author: Joy Shi
categories:
date: 2020-01-29
draft: false
excerpt: |
  Standardization for time-fixed treatments is described, with a focus on
  (1) how to interpret standardized estimates, (2) how to use models to estimate 
  standardized estimates, and (3) the use of bootstrapping to obtain 95% 
  confidence intervals. 
layout: single
links:
- icon: file-powerpoint
  icon_pack: fas
  name: Slide Deck
  url: /teaching/2-standardization/joy-shi-standardization.pdf
- icon: file-pdf
  icon_pack: fas
  name: Exercises
  url: /teaching/2-standardization/joy-shi-standardization-exercises.pdf
- icon: code
  icon_pack: fas
  name: R Code
  url: /teaching/2-standardization/joy-shi-standardization-rcode.R  
subtitle: 
title: "Standardization for time-fixed treatments"
---

<span style="color:#4b7863; font-family: 'Garamond'; font-size: 1.5em; font-weight: 100">Learning objectives</span>

1. Describe standardization to estimate marginal effects.
2. Interpret standardized estimates
3. Use modeling to estimate standardized estimates with many covariates.
4. Describe bootstrapping to obtain 95% confidence intervals. 
<br><br>

<span style="color:#4b7863; font-family: 'Garamond'; font-size: 1.5em; font-weight: 100">Notes</span>

The R code uses data from the NHANES I Epidemiologic Follow-Up Study (NHEFS). 
You can download the data used for this code [here](https://www.hsph.harvard.edu/miguel-hernan/causal-inference-book/).
<br><br>

<span style="color:#4b7863; font-family: 'Garamond'; font-size: 1.5em; font-weight: 100">Additional readings or resources</span>  
1. [Causal Inference: What If](https://www.hsph.harvard.edu/miguel-hernan/causal-inference-book/) (Chapter 13)
2. [Ahern J, Hubbard A, Galea S. Estimating the effects of potential public health interventions on population disease burden: a step-by-step illustration of causal inference methods. American journal of epidemiology. 2009 May 1;169(9):1140-7.](https://doi.org/10.1093/aje/kwp015)
