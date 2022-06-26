---
author: Joy Shi, Sonja A. Swanson, Peter Kraft, Bernard Rosner, Immaculata De Vivo, and Miguel A. Hernán
categories:
- Mendelian Randomization
- Instrumental Variable Analysis
- Structural Mean Models
- Causal Inference
- Cardiovascular Disease Epidemiology
date: "2022-01-01"
draft: false
excerpt: |
  **January 2022**\
  *Epidemiology*
  
  **Joy Shi**, Sonja A. Swanson, Peter Kraft, Bernard Rosner, Immaculata De Vivo, and Miguel A. Hernán
  
  We describe instrumental variable analysis with a time-varying exposure, 
  with an emphasis on the types of causal estimands that can be targeted, the 
  assumptions required for identification, and the use of g-estimation of 
  structural mean models to estimate these effects.
layout: single
links:
- icon: doi
  icon_pack: ai
  name: Article
  url: https://doi.org/10.1097/ede.0000000000001417
- icon: twitter
  icon_pack: fab
  name: Tweetorial
  url: https://twitter.com/joy_shi1/status/1493450085467926533
- icon: github
  icon_pack: fab
  name: R Code
  url: https://github.com/joy-shi1/smms-and-iv
subtitle: 
title: "Mendelian randomization with repeated measures of a time-varying exposure: 
an application of structural mean models"
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
  Epidemiology<br><br>
  <span style="color:#4b7863; font-family: 'Garamond'; font-size: 1.3em; font-weight: 100">Published</span><br>  
  January 2022<br><br>
</div>
<div class="footer"><br></div>

<span style="color:#4b7863; font-family: 'Garamond'; font-size: 1.5em; font-weight: 100">Abstract</span>  
Mendelian randomization (MR) is often used to estimate effects of time-varying exposures on health outcomes using observational data. However, MR studies typically use a single measurement of exposure and apply conventional instrumental variable (IV) methods designed to handle time-fixed exposures. As such, MR effect estimates for time-varying exposures are often biased, and interpretations are unclear. We describe the instrumental conditions required for IV estimation with a time-varying exposure, and the additional conditions required to causally interpret MR estimates as a point effect, a period effect or a lifetime effect depending on whether researchers have measurements at a single or multiple time points. We propose methods to incorporate time-varying exposures in MR analyses based on g-estimation of structural mean models, and demonstrate its application by estimating the period effect of alcohol intake, high-density lipoprotein cholesterol and low-density lipoprotein cholesterol on intermediate coronary heart disease outcomes using data from the Framingham Heart Study. We use this data example to highlight the challenges of interpreting MR estimates as causal effects, and describe other extensions of structural mean models for more complex data scenarios.

<span style="color:#4b7863; font-family: 'Garamond'; font-size: 1.5em; font-weight: 100">Twitter</span>  
A tweetorial on this paper is available [here](https://twitter.com/joy_shi1/status/1493450085467926533).

<span style="color:#4b7863; font-family: 'Garamond'; font-size: 1.5em; font-weight: 100">R Code</span>  
R code to replicate the simulations presented in the Appendix of this paper are available on [Github](https://github.com/joy-shi1/smms-and-iv).
