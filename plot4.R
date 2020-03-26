#read table
power_consumptiondata <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )
#data/time 
TimeDate <- strptime(paste(power_consumptiondata$Date, power_consumptiondata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
power_consumptiondata <- cbind(power_consumptiondata , TimeDate)
#change classes
power_consumptiondata$Date <- as.Date(power_consumptiondata$Date, format="%d/%m/%Y")
power_consumptiondata$Time <- format(power_consumptiondata$Time, format="%H:%M:%S")
Global_active_power <- as.numeric(power_consumptiondata$Global_active_power)
Global_reactive_power <- as.numeric(power_consumptiondata$Global_reactive_power)
Voltage <- as.numeric(power_consumptiondata$Voltage)
Sub_metering_1 <- as.numeric(power_consumptiondata$Sub_metering_1)
Sub_metering_2  <- as.numeric(power_consumptiondata$Sub_metering_2)
Sub_metering_3<- as.numeric(power_consumptiondata$Sub_metering_3)
#subset data
subsetdata <- subset(power_consumptiondata, Date == "2007-02-01" | Date =="2007-02-02")
#make plot
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
with(subsetdata, plot(TimeDate, Global_active_power, type="l", xlab="", ylab="Global Active Power"))
with(subsetdata, plot(TimeDate, Voltage, type = "l", xlab="datetime", ylab="Voltage"))
with(subsetdata, plot(TimeDate, Sub_metering_1 , type="l", xlab="Day", ylab="Energy sub metering"))
lines(subsetdata$TimeDate, subsetdata$Sub_metering_2, type="l", col= "red")
lines(subsetdata$TimeDate,subsetdata$Sub_metering_3,type="l", col= "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty="n",  lwd=2, col=c("black", "red", "blue"))
with(subsetdata, plot(TimeDate, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))
dev.off()