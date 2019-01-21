# TargetFISH
Welcome to TargetFISH. This supplementary materials described in article "Target catch-per-unit-effort standardization of chub mackerel Scomber colias in multispecies fisheries at the Central-Eastern Atlantic" (2019).

The impact of multispecies fisheries has been studied to the calculation of target chub mackerel fishery (CPUE), which describes the fishing tactics fully in different seasons and years. Also the impact changes the biomass stock assessment and creates management risks to the population in the Central-Eastern Atlantic. Statistical fishery data in period 2004-2017 were processed by the SQL program with the Postgres DBMS features, therefore the target fishery was determined based on the analysis and qualification of the catch composition for each noon report ship from the 349004 rows database. Target catch-per-unit-efforts were standardized by the generalized linear model (GLM), which were used later for stock assessment by Bayesian state-space model. Comparison of standardized catch-per-unit-efforts with statistical fishery data without preliminary filter processing, which allowed us to identify the maximum purity model with low deviation parameters in 2 times. Standardization and fitting of target catch-per-unit-efforts occur in 4 times better. In result, there is a more accurate calculation of biomass in the scenario with target chub mackerel fishery, which has an error of mean value ± 25 tons relative to ± 52 tons. At the same time, the scenario without preliminary filter processing shows an overestimated 1.19 current biomass and an underestimated 1.09 fishing mortality to the MSY point. Therefore, we can conclude about the strong impact of multispecies fisheries to the stock assessment, which creates risks of underestimating the fishing mortality, further overexploitation of the population and drop in the fishery even.



# Installation
SQL instructions.
To test the sample database, you need to upload it to your SQL server. Next in the function field add and execute code from the TargetFISH file.sql.

R instructions.
For the calculation study tidyr and dplyr may be installed with

install.packages("tidyr")

install.packages("dplyr")

For testing the data you must copy all files to one folder, also don't forget change your working directory with 

getwd()

setwd()

You may need to have R Tools installed on your system to install the development version from GitHub. See the instructions for (R Tools for Windows or R Tools for Mac OS X).



# Questions / Comments / Problems
We welcome any feedback, questions or bug reports on the page. 

