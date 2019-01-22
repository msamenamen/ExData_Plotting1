library(data.table)

data <- read.table(text = grep("^[1,2]/2/2007", readLines("household_power_consumption.txt"), value = TRUE), sep=";", na.strings="?")
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

png("plot1.png", width=480, height=480, units="px")
hist(data$Global_active_power,  xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")

dev.off()