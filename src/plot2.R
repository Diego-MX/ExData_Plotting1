# Diego, January 2015.
# Modified March

# Uncomment and change for directory.
#setwd("~/Sync/Dropbox/R/Coursera/4 Data Analysis/Project 1 (repository)/src/")


if(file.exists("Read Household.R"))
source("Read Household.R")
household <- read.household()


# Create the plot.
setwd("../figure")
png("plot2.png", width=480, height=480, units="px")

  with(household, plot(Time, Global_active_power,
    type="l", xlab="",
    ylab="Global Active Power (kilowatts)"))

dev.off()
setwd("../src")



