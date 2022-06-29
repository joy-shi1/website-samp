---
author: Joy Shi
categories:
date: "2021-12-06"
draft: false
excerpt: |
  R code for g-estimation of structural nested cumulative failure time models 
  via confounding adjustment or using an instrumental variable. 
featured: true
layout: single
links:
- icon: github
  icon_pack: fab
  name: Software
  url: https://github.com/joy-shi1/sncftms
- icon: doi
  icon_pack: ai
  name: SNCFTMs / confounding
  url: https://doi.org/10.1080/01621459.2012.682532
- icon: doi
  icon_pack: ai
  name: SNCFTMs / IV 
  url: https://doi.org/10.1186/s12874-021-01449-w
subtitle: ""
tags:
title: Structural nested cumulative failure time models
---
<span style="color:#4b7863; font-family: 'Garamond'; font-size: 1.5em; font-weight: 100">Description</span>

G-estimation of structural nested cumulative failure time models (SNCFTMs) is a method to estimate the causal effect of a time-varying treatment on a failure-time outcome in the presence of informative right-censoring and treatment-confounder feedback. Under certain "no interaction" conditions, g-estimates of SNCFTMs can be used to calculate marginal cumulative risks of the outcome under static treatment regimes.

R code is provided to g-estimate SNCFTMs based on
1. Adjustment of exposure-outcome confounders 
2. Instrumental variable analysis

<br>
<span style="color:#4b7863; font-family: 'Garamond'; font-size: 1.5em; font-weight: 100">Additional Resources</span>

Additional information about the methods are available at:
1. [Picciotto S, Hernán MA, Page JH, Young JG, Robins JM. Structural nested cumulative failure time models to estimate the effects of interventions. Journal of the American Statistical Association. 2012 Sep 1;107(499):886-900.](https://doi.org/10.1080/01621459.2012.682532)
2. [Shi J, Swanson SA, Kraft P, Rosner B, De Vivo I, Hernán MA. Instrumental variable estimation for a time-varying treatment and a time-to-event outcome via structural nested cumulative failure time models. 2021 Dec;21(1):1-2.](https://doi.org/10.1186/s12874-021-01449-w)

The SNCFTM functions are based on the SNCFTM SAS macro by Sally Picciotto (more information is available [here](https://cdn1.sph.harvard.edu/wp-content/uploads/sites/148/2020/05/sncftmshell.zip)).

<br>
<span style="color:#4b7863; font-family: 'Garamond'; font-size: 1.5em; font-weight: 100">Simulated Data Examples</span>

Please see the data example as an illustration of how the data is to be set up to run these models.

Simulations to assess the performance of these models are also available. Data were generated according to the following DAGs:

<table>
  <tr>
    <td style="width:200px; font-size:16px"><b>Data generating model</b></td>
    <td style="text-align:center; vertical-align:middle; font-size:16px"><b>DAG</b></td>
  </tr>
  <!-- DAG 1 -->
  <tr>
    <td style="width:200px; vertical-align:middle; font-size:16px">
      Time-fixed instrument, exposure, confounder and outcome
    </td>
    <td style="padding-left: 0px; text-align: center">
      {{< figure src="dag1.png" width=51% >}}
    </td>
  </tr>
  <!-- DAG 2 -->
  <tr>
    <td style="width:200px; vertical-align:middle; font-size:16px">
      Time-fixed instrument, exposure and confounder<br><br>
      Time-varying outcome	
    </td>
    <td style="padding-left: 0px; text-align: center">
      {{< figure src="dag2.png" width=76% >}}
    </td>
  </tr>  
  <!-- DAG 3 -->
  <tr>
    <td style="width:200px; vertical-align:middle; font-size:16px">
      Time-fixed instrument<br><br>
      Time-varying exposure, confounder and outcome	</td>
    <td style="padding-left: 0px; text-align: center">
      {{< figure src="dag3.png" width=100% >}}
    </td>
  </tr>  
</table>
