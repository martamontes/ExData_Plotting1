#read table
power_consumptiondata <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )
#change classes
power_consumptiondata$Date <- as.Date(power_consumptiondata$Date, format="%d/%m/%Y")
Global_active_power <- as.numeric(power_consumptiondata$Global_active_power)
#subset data
subsetdata <- subset(power_consumptiondata, Date == "2007-02-01" | Date =="2007-02-02")
#make plot
png("plot1.png", width=480, height=480)
hist(Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()