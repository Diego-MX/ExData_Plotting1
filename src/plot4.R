# Diego, January 2015.
# Modified March

# Uncomment and change for directory.
# setwd("~/Sync/Dropbox/R/Coursera/4 Data Analysis/Project 1 (repository)/src/")


if(file.exists("Read Household.R")){
    source("Read Household.R")}
household <- read.household()


# Create the plot.
setwd("../figure")
png("plot4.png", width=480, height=480, units="px")
with(household, {par(mfrow=c(2,2))

    # First Plot
    plot(Time, Global_active_power, type="l", col="black",
        xlab="", ylab="Global Active Power")

    # Second Plot
    plot(Time, Voltage, type="l", col="black",
        xlab="datetime")

    # Third Plot
    plot(Time, Sub_metering_1, type="l", col="black", xlab="",
         ylab="Energy sub metering")
    lines(Time, Sub_metering_2, col="red")
    lines(Time, Sub_metering_3, col="blue")
    legend("topright", lty=1, col=c("black", "red", "blue"),
        legend=c("Sub_metering_1", "Sub_metering_2",
            "Sub_metering_3"))
    
    # Fourth Plot
    plot(Time, Global_reactive_power, type="l",
        xlab="datetime")})

dev.off()
setwd("../src")



