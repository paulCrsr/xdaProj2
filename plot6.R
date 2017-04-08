# Plot 6:
# Compare emissions from motor vehicle sources in Baltimore City with emissions 
# from motor vehicle sources in Los Angeles County, California (fips ==
# "06037"). Which city has seen greater changes over time in motor vehicle
# emissions?

setwd("/Users/posborne/Coursera/ExploratoryDataAnalysis/wk4/xdaProj2")
source("loadData.R")
library(dplyr)
library(ggplot2)
library(RColorBrewer)

# Get SCCs for all motor vehicle sectors...
sectorNames <- as.character(unique(SCC$EI.Sector))
vehicleSectorNames <- grep("^Mobile.+Vehicles$", sectorNames, ignore.case=TRUE, value=TRUE)
vehicleSccs <- 
    (filter(SCC, EI.Sector %in% vehicleSectorNames) %>%
         select(SCC))$SCC

# Filter by motor vehicle and join sector names.
vehicleEmissions <-
    filter(NEI, SCC %in% vehicleSccs & fips %in% c("24510", "06037")) %>%
    mutate(year = as.factor(year), fips=ifelse(fips=="24510", "Baltimore City", "Los Angeles County")) %>%
    left_join(SCC, by=c("SCC","SCC"))

png("plot6.png", width = 800 , height = 600, units="px")

g <- ggplot(vehicleEmissions, aes(x=year, y=log(Emissions))) +
    geom_boxplot(aes(fill=fips)) +
    labs(x="", y="log(tons PM2.5)") +
    facet_wrap(~EI.Sector, ) +
    scale_fill_brewer(palette = "Set1") +
    ggtitle("Comparison of PM2.5 emissions due to motor-vehicles\n in Baltimore City and Los Angeles County") +
    ylab("log(tons PM2.5)") +
    xlab("") +
    theme_bw()

print(g)

dev.off()