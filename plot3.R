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
    group_by(year, type) %>%
    summarize(total = sum(Emissions))

png("plot3.png", width = 800 , height = 600, units="px")

g <- 
    ggplot(baltimoreCity, aes(year, total, col=type)) +
    geom_line() +
    ylab("PM2.5 (tons)") + 
    ggtitle("Total PM2.5 emission trends by type\nfor Balimore City, Maryland") +
    theme_bw()

print(g)

dev.off()