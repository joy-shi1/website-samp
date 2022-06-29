---
author: Joy Shi
categories:
date: 2020-01-28
draft: false
excerpt: |
  Instrumental variable (IV) estimation for time-fixed treatments, with an 
  emphasis on the underlying assumptions of IV, common estimators for IV, and
  implementation of the methods in R.
layout: single
links:
- icon: file-powerpoint
  icon_pack: fas
  name: Slide Deck
  url: /teaching/3-iv-estimation/joy-shi-iv-estimation.pdf
- icon: code
  icon_pack: fas
  name: R Code
  url: /teaching/3-iv-estimation/joy-shi-iv-estimation-rcode.R  
subtitle: 
title: "Instrumental variable estimation for time-fixed treatments"
---

<span style="color:#4b7863; font-family: 'Garamond'; font-size: 1.5em; font-weight: 100">Learning objectives</span>

1. Define an instrumental variable
2. Describe the standard IV estimator
3. Identify the limitations of IV estimation
4. Conduct an IV analysis using R.
<br><br>

<span style="color:#4b7863; font-family: 'Garamond'; font-size: 1.5em; font-weight: 100">Notes</span>

The R code uses data from the NHANES I Epidemiologic Follow-Up Study (NHEFS). 
You can download the data used for this code [here](https://www.hsph.harvard.edu/miguel-hernan/causal-inference-book/).
<br><br>

<span style="color:#4b7863; font-family: 'Garamond'; font-size: 1.5em; font-weight: 100">Additional readings or resources</span>  
1. [Causal Inference: What If](https://www.hsph.harvard.edu/miguel-hernan/causal-inference-book/) (Chapter 16)
2. [Labrecque J, Swanson SA. Understanding the assumptions underlying instrumental variable analyses: a brief review of falsification strategies and related tools. Current epidemiology reports. 2018 Sep;5(3):214-20.p](https://doi.org/10.1007/s40471-018-0152-1)
3. [McClellan M, McNeil BJ, Newhouse JP. Does more intensive treatment of acute myocardial infarction in the elderly reduce mortality?: analysis using instrumental variables. Jama. 1994 Sep 21;272(11):859-66.](https://doi.org/10.1001/jama.1994.03520110039026)