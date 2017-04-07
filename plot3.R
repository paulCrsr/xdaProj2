# Plot3:
# Of the four types of sources indicated by the (point, nonpoint, 
# onroad, nonroad) variable, which of these four sources have seen 
# decreases in emissions from 1999-2008 for Baltimore City? Which have 
# seen increases in emissions from 1999-2008 
# 
# Use the ggplot2 plotting system to make a plot answer this question.
# 
setwd("/Users/posborne/Coursera/ExploratoryDataAnalysis/wk4/xdaProj2")
source("loadData.R")
library(dplyr)
library(ggplot2)

baltimoreCity <- 
    subset(NEI, fips == "24510" & Emissions > 0) %>%
    mutate(year = as.factor(year))

png("plot3.png", width = 800 , height = 600, units="px")

g <- 
    ggplot(baltimoreCity, aes(year, log(Emissions))) +
    geom_boxplot() +
    facet_grid(.~type) + 
    ylab("log(tons PM2.5)") + 
    ggtitle("Total PM2.5 emission trends by type\nfor Balimore City, Maryland")

print(g)

dev.off()