#read table
power_consumptiondata <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )
#data/time 
TimeDate <- strptime(paste(power_consumptiondata$Date, power_consumptiondata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
power_consumptiondata <- cbind(power_consumptiondata , TimeDate)
#change classes
power_consumptiondata$Date<- as.Date(power_consumptiondata$Date, format="%d/%m/%Y")
power_consumptiondata$Time<- format(power_consumptiondata$Time, format="%H:%M:%S")
Global_active_power <- as.numeric(power_consumptiondata$Global_active_power)
#subset data
subsetdata <- subset(power_consumptiondata, Date == "2007-02-01" | Date =="2007-02-02")
#create plot 
png("plot2.png", width=480, height=480)
with(subsetdata, plot(TimeDate, Global_active_power, type="l", xlab=NA, ylab="Global Active Power (kilowatts)"))
dev.off()