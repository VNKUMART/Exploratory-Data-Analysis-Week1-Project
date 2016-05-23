## Downloaded and unziped data

dataFile <- "./data/household_power_consumption.txt" 
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 

## We will only be using data from the dates 2007-02-01 and 2007-02-02
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] 

## Numeric Data 
globalActivePower <- as.numeric(subSetData$Global_active_power) 

## Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels
png("plot1.png", width=480, height=480) 

## Plot Histogram 
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)") 
dev.off() 