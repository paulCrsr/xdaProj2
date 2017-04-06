# Plot1: 
# Have total emissions from PM2.5 decreased in the United States from 1999 to 
# 2008? Using the base plotting system, make a plot showing the total PM2.5 
# emission from all sources for each of the years 1999, 2002, 2005, and 2008.
setwd("/Users/posborne/Coursera/ExploratoryDataAnalysis/wk4/xdaProj2")
source("loadData.R")
library(dplyr)

png("plot1.png", width = 800 , height = 600, units="px")

boxplot(log10(Emissions) ~ year, 
        data = NEI, 
        ylab ="log10(Emissions)", 
        main ="Total emissions by year",
        pch = 20,
        cex = 0.5)

dev.off()
