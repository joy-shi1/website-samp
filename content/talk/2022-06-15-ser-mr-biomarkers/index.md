---
author: Joy Shi
categories:
date: "2022-06-15T15:45:59-06:00"
date_end: "2022-06-15T17:15:59-06:00"
draft: false
event: Society for Epidemiologic Research, 2022
event_url: https://epiresearch.org/annual-meeting/2022-meeting/
excerpt: An oral presentation during the SER session on "Topics in study design and analytical methods".
featured: true
layout: single
links:
- icon: file-powerpoint
  icon_pack: fas
  name: Slides
  url: /talk/2022-06-15-ser-mr-biomarkers/joy-shi-ser-mr-biomarkers.pdf
location: Chicago, Illinois, US
show_post_time: false
subtitle: 
title: "Mendelian randomization with pharmaceutically modifiable biomarkers"
---

**Joy Shi<sup>1,2</sup>, Sonja Swanson<sup>1,2,3</sup>, Elizabeth Diemer<sup>1,2</sup>, Miguel A. Hernán<sup>1,2,4<sup>**

<sup>1</sup> Department of Epidemiology, Harvard T.H. Chan School of Public Health, Boston, MA<br>
<sup>2</sup> The CAUSALab, Harvard T.H. Chan School of Public Health, Boston, MA<br>
<sup>3</sup> Department of Epidemiology, University of Pittsburgh Graduate School of Public Health, Pittsburgh, PA<br>
<sup>4</sup> Department of Biostatistics, Harvard T.H. Chan School of Public Health, Boston, MA <br><br><br>

**Abstract**

Biomarker levels are often affected by medications, e.g., LDL cholesterol is affected by statin therapy. Therefore, when a biomarker is the exposure of interest, an analysis which ignores  medication use may be estimating the combined contributions of the biomarker and the medications that affect it. When time-varying information on medication use is incorporated into an analysis—say, of LDL cholesterol and coronary heart disease—two possible approaches are: (1) to restrict the analysis to non-users of statins (Figure 1A); and (2) to conduct the analysis under a hypothetical intervention of no statin use in the entire population (Figure 1B). The latter approach requires adjustment for confounders of the effect of statins on coronary heart disease via g-methods.  

The implications of these approaches to handle drug use have not been studied for Mendelian Randomization (MR) studies. An important concern is that, because MR studies use a genetic variant as if it were an instrumental variable (IV), restriction to non-users may induce selection bias. We used simulated and real data to evaluate different analytical approaches that could be applied in a MR study designed to estimate the effect of a time-varying exposure affected by medication use.

We considered two IV estimators—(1) two-stage least squares; and (2) g-estimation of structural nested cumulative failure time models (SNCFTMs). Our simulations demonstrated that restricting on medication use resulted in biased estimates, regardless of the IV estimator. Unbiased estimates were obtained when the g-formula was used in combination IV estimation, but only if the IV estimator appropriately handled repeated measures of a time-varying exposure and outcome (e.g., g-estimation of SNFTMs). In the presentation, we will further discuss results from applying these analytic approaches to national biobank data to estimate the effect of LDL cholesterol on cardiovascular disease in the presence of widespread statin use.


<b>(A)</b><br>
<img style="float: left" src="/talk/2022-06-15-ser-mr-biomarkers/joy-shi-ser-mr-biomarkers-abstract-image1.png"
   alt="directed acyclic graph"
   style="float: left; margin-left:10px" 
   display="inline"/><br clear="left">
   
<b>(B)</b><br>
<img style="float: left" src="/talk/2022-06-15-ser-mr-biomarkers/joy-shi-ser-mr-biomarkers-abstract-image2.png"
   alt="single world intervention graph"
   style="float: left; margin-left:10px"
   display="inline"/><br clear="left">
   
**Figure 1.** Causal diagrams for time-fixed instrument \\(Z\\) (instrument), \\(U\\) (unmeasured confounder) and \\(W\\) (measured confounder) at baseline; and time-varying variables \\(A_k\\) (exposure), \\(M_k\\) (medication use), and \\(Y_{k+1}\\) (outcome). For simplicity, only two time points are presented in **(A)** the causal directed acyclic graph which depicts conditioning on medication use and **(B)** the single world intervention graph which depicts the counterfactual world in which there is no medication use.

