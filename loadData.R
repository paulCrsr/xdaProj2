# This file:
# 1. Downloads https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip to `./download/dataset.zip` and unzips it.
# 2. Reads the unzipped, raw data to data frames NEI and SCC. Data size: 30MB compressed.

setwd("/Users/posborne/Coursera/ExploratoryDataAnalysis/wk4/xdaProj2")

library("downloader")   # For downloading and extracting the zip file.

# Define the paths used by the application.
dirs <- list(download = file.path(".", "download"))
downloadZipFile <- file.path(dirs$download, "datasets.zip")
rawDataFile <- file.path(dirs$download, "summarySCC_PM25.rds")

# Download and unzip...
if (!file.exists(rawDataFile)) {
        message("Downloading zip file...")
        dir.create(dirs$download, recursive = TRUE)
        download("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip",
                 dest=downloadZipFile,
                 mode="wb"
        )
        unzip(downloadZipFile, exdir=dirs$download)
        message("... download complete!")
}

# Load the data...
if (!exists("NEI")) NEI <- readRDS(file.path(dirs$download, "summarySCC_PM25.rds"))
if (!exists("SCC")) SCC <- readRDS(file.path(dirs$download, "Source_Classification_Code.rds"))
