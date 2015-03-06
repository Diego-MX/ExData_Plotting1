# Diego, January 2015.
# Modified March

# Uncomment and change for directory.
#setwd("~/Sync/Dropbox/R/Coursera/4 Data Analysis/Project 1 (repository)/src/")


if(file.exists("Read Household.R"))
source("Read Household.R")
household <- read.household()


# Create the plot.
setwd("../figure")
png("plot3.png", width=480, height=480, units="px")

  with(household,{
    plot(Time, Sub_metering_1, type="l", col="black",
        xlab="", ylab="Energy sub metering")
    lines(Time, Sub_metering_2, col="red")
    lines(Time, Sub_metering_3, col="blue")
    legend("topright", lty=1, col=c("black", "red", "blue"),
        legend=c("Sub_metering_1", "Sub_metering_2",
            "Sub_metering_3"))})
            
dev.off()
setwd("../src")


