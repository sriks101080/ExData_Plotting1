## SET THE WORKING DIRECTORY TO THE DATA LOCATION AND THE R FILE SHOULD BE IN SAME FOLDER
## Reading Data
mydata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?",stringsAsFactors=FALSE)
## Date Conversion
mydata$Date <- as.Date(mydata$Date, format="%d/%m/%Y")
##Create New dataset with data of first 2 days in feb 2007
newdata <- subset(mydata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
## set the data
attach(newdata)

## Converting dates
datetime <- paste(as.Date(Date), Time)
ndatetime <- as.POSIXct(datetime)

## Plot 3
with(newdata, {
  plot(Sub_metering_1~ndatetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~ndatetime,col='Red')
  lines(Sub_metering_3~ndatetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
