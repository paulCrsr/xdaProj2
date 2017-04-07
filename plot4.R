# Plot 4:
# Across the United States, how have emissions from coal combustion-related 
# sources changed from 1999-2008?
setwd("/Users/posborne/Coursera/ExploratoryDataAnalysis/wk4/xdaProj2")
source("loadData.R")
library(dplyr)
library(ggplot2)

sectorNames <- as.character(unique(SCC$EI.Sector))
coalSectorNames <- grep("coal", sectorNames, ignore.case=TRUE, value=TRUE)
coalSccs <- 
    (filter(SCC, EI.Sector %in% coalSectorNames) %>%
    select(SCC))$SCC

coalEmissions <-
    filter(NEI, SCC %in% coalSccs) %>%
    group_by(year) %>%
    summarize(total = sum(Emissions)/1e+06)

png("plot4.png", width = 800 , height = 600, units="px")

with(coalEmissions, 
     barplot(
         total,
         year,
         names.arg=year,
         ylab ="Tons PM2.5 (millions)",
         main ="Plot1: PM2.5 emissions due to coal-combustion by year for all states")
)

dev.off()
