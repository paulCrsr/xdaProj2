# Plot 5:
# How have emissions from motor vehicle sources changed from 1999-2008 in
# Baltimore City?

setwd("/Users/posborne/Coursera/ExploratoryDataAnalysis/wk4/xdaProj2")
source("loadData.R")
library(dplyr)
library(ggplot2)

# Get SCCs for all motor vehicle sectors...
sectorNames <- as.character(unique(SCC$EI.Sector))
vehicleSectorNames <- grep("^Mobile.+Vehicles$", sectorNames, ignore.case=TRUE, value=TRUE)
vehicleSccs <- 
    (filter(SCC, EI.Sector %in% vehicleSectorNames) %>%
         select(SCC))$SCC

# Filter by motor vehicle and join sector names.
vehicleEmissions <-
    filter(NEI, SCC %in% vehicleSccs & fips == "24510") %>%
    mutate(year = as.factor(year)) %>%
    left_join(SCC, by=c("SCC","SCC"))

png("plot5.png", width = 800 , height = 600, units="px")

g <- ggplot(vehicleEmissions, aes(year, log(Emissions))) +
    geom_boxplot() +
    facet_grid(~EI.Sector) +
    ggtitle("PM2.5 emissions due to coal-combustion\n across the United States") +
    ylab("log(tons PM2.5)") +
    xlab("") +
    theme_bw()

print(g)

dev.off()