# Plot2:
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
# (fips == 24510) from 1999 to 2008? Use the base plotting system to make a 
# plot answering this question.
setwd("/Users/posborne/Coursera/ExploratoryDataAnalysis/wk4/xdaProj2")
source("loadData.R")
library(dplyr)

png("plot2.png", width = 800 , height = 600, units="px")

baltimoreCity <- 
    subset(NEI, 
           fips == "24510" & 
           year %in% c("1999", "2008") & 
           Emissions > 0) %>%
    group_by(year) %>%
    summarize(total = sum(Emissions))

with(baltimoreCity, 
     barplot(
         total,
         year,
         names.arg=year,
         ylab ="PM2.5 (tons)",
         main = "Plot2: Total PM2.5 emissions change for\nBaltimore City, Maryland")
)

dev.off()
