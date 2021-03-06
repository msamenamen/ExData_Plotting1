library(data.table)

data <- read.table(text = grep("^[1,2]/2/2007", readLines("household_power_consumption.txt"), value = TRUE), sep=";", na.strings="?")
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#make sure data is interpreted correctly
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("plot4.png", width=480, height=480, units="px")
par(mfrow = c(2,2))
plot(datetime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power")

plot(datetime, data$Voltage, type="l", ylab="Voltage")

plot(datetime, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime, data$Sub_metering_2, col="red")
lines(datetime, data$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")

plot(datetime, data$Global_reactive_power, type="l", ylab="Global_reactive_power")

dev.off()