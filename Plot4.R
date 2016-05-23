## Downloaded and unziped data

dataFile <- "./data/household_power_consumption.txt" 
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 

## We will only be using data from the dates 2007-02-01 and 2007-02-02
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] 

## Date-Time Format
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  

## Numeric Data, Global Active Power
globalActivePower <- as.numeric(subSetData$Global_active_power) 

## Numeric Data, Global ReActive Power
globalReactivePower <- as.numeric(subSetData$Global_reactive_power) 

## Numeric Data, Voltage
voltage <- as.numeric(subSetData$Voltage) 

## Sub Metering
subMetering1 <- as.numeric(subSetData$Sub_metering_1) 
subMetering2 <- as.numeric(subSetData$Sub_metering_2) 
subMetering3 <- as.numeric(subSetData$Sub_metering_3) 

## Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels
png("plot4.png", width=480, height=480) 
par(mfrow = c(2, 2))  

## Plot Global Active Power
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2) 

## Plot Voltage
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage") 

## Plot Energy submetering using Date-Time Format, submetering with lines 
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="") 
lines(datetime, subMetering2, type="l", col="red") 
lines(datetime, subMetering3, type="l", col="blue") 

## Apply Legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o") 

## Plot Global Reactive Power
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power") 

dev.off() 