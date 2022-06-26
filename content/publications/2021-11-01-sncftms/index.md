---
author: Joy Shi, Sonja A. Swanson, Peter Kraft, Bernard Rosner, Immaculata De Vivo, and Miguel A. Hernán
categories: 
- Mendelian Randomization
- Instrumental Variable Analysis
- Structural Mean Models
- Causal Inference
- Cancer Epidemiology
date: "2021-11-01"
draft: false
excerpt:  |
  **November 2021**\
  *BMC Medical Research Methodology*
  
  **Joy Shi**, Sonja A. Swanson, Peter Kraft, Bernard Rosner, Immaculata De Vivo, and Miguel A. Hernán
  
  We propose the use of g-estimation of structural nested cumulative failure 
  time models for instrumental variable analyses of time-varying exposures and 
  failure time outcomes.
layout: single
links:
- icon: doi
  icon_pack: ai
  name: Article
  url: https://doi.org/10.1186/s12874-021-01449-w
- icon: twitter
  icon_pack: fab
  name: Tweetorial
  url: https://twitter.com/joy_shi1/status/1464398799120523269
- icon: github
  icon_pack: fab
  name: R Code
  url: https://github.com/joy-shi1/sncftms
subtitle: 
title: "Instrumental variable estimation for a time-varying treatment and a 
  time-to-event outcome via structural nested cumulative failure time models"
---
<style>
.column-left{
  float: left;
  width: 50%;
  text-align: left;
}
.column-right{
  float: right;
  width: 50%;
  text-align: left;
}
.footer {
  clear: both;
  width: 100%;
}
</style>

<div class="column-left">
  <span style="color:#4b7863; font-family: 'Garamond'; font-size: 1.3em; font-weight: 100">Authors</span><br>  
  <b>Joy Shi</b><br>
  Sonja A. Swanson<br>
  Peter Kraft<br>
  Bernard Rosner<br> 
  Immaculata De Vivo<br>  
  Miguel A. Hernán<br>
</div>
<div class="column-right">
  <span style="color:#4b7863; font-family: 'Garamond'; font-size: 1.3em; font-weight: 100">Journal</span><br>  
  BMC Medical Research Methodology<br><br>
  <span style="color:#4b7863; font-family: 'Garamond'; font-size: 1.3em; font-weight: 100">Published</span><br>  
  November 2021<br><br>
</div>
<div class="footer"><br></div>

<span style="color:#4b7863; font-family: 'Garamond'; font-size: 1.5em; font-weight: 100">Abstract</span>  
**Background**: In many applications of instrumental variable (IV) methods, the treatments of interest are intrinsically time-varying and outcomes of interest are failure time outcomes. A common example is Mendelian randomization (MR), which uses genetic variants as proposed IVs. In this article, we present a novel application of g-estimation of structural nested cumulative failure models (SNCFTMs), which can accommodate multiple measures of a time-varying treatment when modelling a failure time outcome in an IV analysis.

**Methods**: A SNCFTM models the ratio of two conditional mean counterfactual outcomes at time k under two treatment strategies which differ only at an earlier time m. These models can be extended to accommodate inverse probability of censoring weights, and can be applied to case-control data. We also describe how the g-estimates of the SNCFTM parameters can be used to calculate marginal cumulative risks under nondynamic treatment strategies. We examine the performance of this method using simulated data, and present an application of these models by conducting an MR study of alcohol intake and endometrial cancer using longitudinal observational data from the Nurses' Health Study.

**Results**: Our simulations found that estimates from SNCFTMs which used an IV approach were similar to those obtained from SNCFTMs which adjusted for confounders, and similar to those obtained from the g-formula approach when the outcome was rare. In our data application, the cumulative risk of endometrial cancer from age 45 to age 72 under the "never drink" strategy (4.0%) was similar to that under the "always ½ drink per day" strategy (4.3%).

**Conclusions**: SNCFTMs can be used to conduct MR and other IV analyses with time-varying treatments and failure time outcomes.

<span style="color:#4b7863; font-family: 'Garamond'; font-size: 1.5em; font-weight: 100">Twitter</span>  
I've tweeted about this paper [here](https://twitter.com/joy_shi1/status/1464398799120523269).

<span style="color:#4b7863; font-family: 'Garamond'; font-size: 1.5em; font-weight: 100">R Code</span>  
R functions for g-estimation structural nested cumulative failure time models (based on IV assumptions or no unmeasured treatment-outcome confounders) are available on [Github](https://github.com/joy-shi1/sncftms). Code is also provided to randomly generate data under the structure and format necessary to run these functions, as well as conduct the simulations presented in this paper. 
