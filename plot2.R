## STEP 1 - READ DATA
data_full<-read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

## STEP 2 - SUBSET DATA
data<-subset(data_full, data_full$Date>=as.Date("2007-02-01") & data_full$Date<=as.Date("2007-02-02"))

## STEP 3- FORMAT DATE
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## STEP 4 - PLOT & SAVE TO PNG
png(file="plot2.png", width=480, height=480)
hist(data$Global_active_power, main="Gobal Active Power", xlab="Global Active Power (kilowatts)",
     ylab="Frequency", col="Red")
dev.off()


