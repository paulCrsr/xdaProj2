# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
# (𝚏𝚒𝚙𝚜 == "𝟸𝟺𝟻𝟷𝟶") from 1999 to 2008? Use the base plotting system t
# o make a plot answering this question.
setwd("/Users/posborne/Coursera/ExploratoryDataAnalysis/wk4/xdaProj2")
source("loadData.R")
library(dplyr)

png("plot2.png", width = 800 , height = 600, units="px")

baltimoreCity <- subset(NEI, fips == "24510" & year %in% c("1999", "2008") & Emissions > 0)

boxplot(log10(Emissions) ~ year, 
        data = baltimoreCity, 
        ylab = "log10(Emissions)", 
        main = "Total emissions by year for\nBaltimore City, Maryland")

dev.off()
