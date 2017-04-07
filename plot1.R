# Plot1: 
# Have total emissions from PM2.5 decreased in the United States from 1999 to 
# 2008? Using the base plotting system, make a plot showing the total PM2.5 
# emission from all sources for each of the years 1999, 2002, 2005, and 2008.
setwd("/Users/posborne/Coursera/ExploratoryDataAnalysis/wk4/xdaProj2")
source("loadData.R")
library(dplyr)

emissionTotals <- 
    group_by(NEI, year) %>%
    summarize(total = sum(Emissions)/1e+06)

png("plot1.png", width = 800 , height = 600, units="px")

options(scipen=NULL)

with(emissionTotals, 
     barplot(
         total,
         year,
         names.arg=year,
         ylab ="Tons PM2.5 (million)",
         main ="Plot1: Total PM2.5 emissions by year for all states")
)


dev.off()
