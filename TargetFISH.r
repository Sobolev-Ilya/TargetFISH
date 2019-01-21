#Load working packages for filtering target data

library(tidyr)
library(dplyr)



#Load data example

africa2017 <- "C:/Users/user/Desktop/africa2017.csv"
africa2017 <- read.csv2(africa2017)
africa2017$catch <- as.numeric(africa2017$catch)
str(africa2017)



#Calculations and filtrations

africa2017 <- africa2017 %>%
    group_by(date) %>%
	group_by(vessel, add = TRUE) %>%
    mutate(catchT = sum(catch)) %>%
    group_by(fish, add = TRUE) %>%
    mutate(percent = round(100*catch/catchT,2))