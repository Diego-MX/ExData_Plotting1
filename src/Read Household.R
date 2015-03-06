# Diego, March 2015

read.household <- function(
  dataFile = "household_power_consumption.txt"){
  require(lubridate)
  require(dplyr)

  if(!file.exists("Household.RData")){
    
    if(!file.exists(dataFile)){
       
      if(!file.exists("Household.zip")){
        url <- paste0("https://d396qusza40orc.cloudfront.net/",
            "exdata%2Fdata%2Fhousehold_power_consumption.zip")
        download.file(url, "Household.zip")}
        
      unzip("Household.zip")}
     
    dataHead <- read.table(dataFile, header=T, sep=";", nrows=5)
    dataClasses <- rep("NULL", length(dataHead))
    dateInd <- names(dataHead) == "Date"
    dataClasses[dateInd] = "character"
    # Date format can't be specified... or can it?
    
    cat("...Reading only first reeeeally long column...")
    dataDate <- read.table(dataFile, header=T, sep=";",
      nrows=2100000, colClasses=dataClasses)
    twodays <- ymd(c("2007-02-01", "2007-02-02"))
    dataIndices <- which(dmy(dataDate$Date) %in% twodays)
    # DMY and YMD come from LUBRIDATE package.
       
    dataSkip <- min(dataIndices)
    dataRows <- max(dataIndices) - dataSkip
     
    household <- read.table(dataFile, header=F, sep=";",
        skip=dataSkip, nrows=dataRows + 1)
    names(household) <- names(dataHead)
    household <- mutate(household, Date=dmy(Date)) %>%
        filter(Date %in% twodays) %>%
        mutate(Time=as.POSIXct(paste(Date, Time)))
     
    save(household, file="Household.RData")}

  load("Household.RData")
  return(household)})



