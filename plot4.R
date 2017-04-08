# Plot 4:
# Across the United States, how have emissions from coal combustion-related 
# sources changed from 1999-2008?
setwd("/Users/posborne/Coursera/ExploratoryDataAnalysis/wk4/xdaProj2")
source("loadData.R")
library(dplyr)
library(ggplot2)

# Get SCCs for all coal sectors...
sectorNames <- as.character(unique(SCC$EI.Sector))
coalSectorNames <- grep("coal", sectorNames, ignore.case=TRUE, value=TRUE)
coalSccs <- 
    (filter(SCC, EI.Sector %in% coalSectorNames) %>%
    select(SCC))$SCC

# Filter by coal-combustion and join sector names.
coalEmissions <-
    filter(NEI, SCC %in% coalSccs) %>%
    mutate(year = as.factor(year)) %>%
    left_join(SCC, by=c("SCC","SCC"))

png("plot4.png", width = 800 , height = 600, units="px")

g <- ggplot(coalEmissions, aes(year, log(Emissions))) +
    geom_boxplot() +
    facet_grid(~EI.Sector) +
    ggtitle("PM2.5 emissions due to coal-combustion\n across the United States") +
    ylab("log(tons PM2.5)") +
    xlab("") +
    theme_bw()

print(g)

dev.off()
