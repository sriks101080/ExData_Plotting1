## SET THE WORKING DIRECTORY TO THE DATA LOCATION AND THE R FILE SHOULD BE IN SAME FOLDER
## Reading Data
mydata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?",stringsAsFactors=FALSE)
## Date Conversion
mydata$Date <- as.Date(mydata$Date, format="%d/%m/%Y")
##Create New dataset with data of first 2 days in feb 2007
newdata <- subset(mydata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
## set the data
attach(newdata)

##Plot 1
hist(Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", 
     ylab="Frequency", col="Red")
## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
