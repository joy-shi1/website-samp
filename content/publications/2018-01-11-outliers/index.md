---
author: Joy Shi, Jill Korsiak, Daniel E. Roth
categories: 
- Maternal and Child Health
date: "2018-03-01"
draft: false
excerpt:  |
  **March 2018**\
  *Annals of Epidemiology*
  
  **Joy Shi**, Jill Korsiak, Daniel E. Roth
  
  We propose and demonstrate the use of jackknife residuals to identify 
  biological implausible values and outliers in longitudinal growth data.
layout: single
links:
- icon: doi
  icon_pack: ai
  name: Article
  url: https://doi.org/10.1016/j.annepidem.2018.01.007
- icon: github
  icon_pack: fab
  name: Stata Code
  url: https://github.com/joy-shi1/outliers-in-anthro-data
subtitle: 
title: "New approach for the identification of implausible values and outliers 
  in longitudinal childhood anthropometric data"
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
  Jill Korsiak<br>
  Daniel E. Roth
</div>
<div class="column-right">
  <span style="color:#4b7863; font-family: 'Garamond'; font-size: 1.3em; font-weight: 100">Journal</span><br>  
  Annals of Epidemiology<br><br>
  <span style="color:#4b7863; font-family: 'Garamond'; font-size: 1.3em; font-weight: 100">Published</span><br>  
  March 2018<br><br>
</div>
<div class="footer"><br></div>

<span style="color:#4b7863; font-family: 'Garamond'; font-size: 1.5em; font-weight: 100">Abstract</span>  
**Purpose**: We aimed to demonstrate the use of jackknife residuals to take advantage of the longitudinal nature of available growth data in assessing potential biologically implausible values and outliers.

**Methods**: Artificial errors were induced in 5% of length, weight, and head circumference measurements, measured on 1211 participants from the Maternal Vitamin D for Infant Growth (MDIG) trial from birth to 24 months of age. Each child's sex- and age-standardized z-score or raw measurements were regressed as a function of age in child-specific models. Each error responsible for a biologically implausible decrease between a consecutive pair of measurements was identified based on the higher of the two absolute values of jackknife residuals in each pair. In further analyses, outliers were identified as those values beyond fixed cutoffs of the jackknife residuals (e.g., greater than +5 or less than -5 in primary analyses). Kappa, sensitivity, and specificity were calculated over 1000 simulations to assess the ability of the jackknife residual method to detect induced errors and to compare these methods with the use of conditional growth percentiles and conventional cross-sectional methods.

**Results**: Among the induced errors that resulted in a biologically implausible decrease in measurement between two consecutive values, the jackknife residual method identified the correct value in 84.3%-91.5% of these instances when applied to the sex- and age-standardized z-scores, with kappa values ranging from 0.685 to 0.795. Sensitivity and specificity of the jackknife method were higher than those of the conditional growth percentile method, but specificity was lower than for conventional cross-sectional methods.

**Conclusion**: Using jackknife residuals provides a simple method to identify biologically implausible values and outliers in longitudinal child growth data sets in which each child contributes at least 4 serial measurements.

<span style="color:#4b7863; font-family: 'Garamond'; font-size: 1.5em; font-weight: 100">Stata Code</span>  
Stata code to implement the proposed method is available on [Github](https://github.com/joy-shi1/outliers-in-anthro-data).
