
## STEP 1 - READ DATA
data_full<-read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

## STEP 2 - SUBSET DATA
data<-subset(data_full, data_full$Date>=as.Date("2007-02-01") & data_full$Date<=as.Date("2007-02-02"))

## STEP 3- FORMAT DATE
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## STEP 4 - PLOT & SAVE TO PNG
png(file="plot3.png", width=480, height=480)
with(data, {plot( 
  Datetime, Sub_metering_1, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
