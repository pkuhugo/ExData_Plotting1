data <- read.table("../household_power_consumption.txt", sep = ';', header = TRUE)
date1 <- strptime(data$Date,"%d/%m/%Y")
data1 <- data[date1>= as.POSIXlt("2007-02-01") & date1<= as.POSIXlt("2007-02-02"),]

#figure 1
png("plot1.png", width = 480, height = 480, units = "px")
hist(as.numeric(as.character(data1$Global_active_power)), col = "red", xlab = "Global active power (kilowatts)", ylim = c(0,1200), main = "Global Active Power")
axis(side = 1, at = seq(0,6,2), labels= seq(0,6,2))
dev.off()

#figure2 
time1 = paste(data1$Date, data1$Time)
time2 = strptime(time1, "%d/%m/%Y %H:%M:%S")
png("plot2.png", width = 480, height = 480, units = "px")
plot(time2, as.numeric(as.character(data1$Global_active_power)), type = "l", ylab = "Global active power (kilowatts)", xlab = "")
dev.off()

#figure3
png("plot3.png", width = 480, height = 480, units = "px")
plot(time2, as.numeric(as.character(data1$Sub_metering_1)), type = "l", ylab = "Energy sub metering", xlab = "")
lines(time2, as.numeric(as.character(data1$Sub_metering_2)), col = "red")
lines(time2, as.numeric(as.character(data1$Sub_metering_3)), col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red","blue"))
dev.off()

#figure4
png("plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2,2))
plot(time2, as.numeric(as.character(data1$Global_active_power)), type = "l", ylab = "Global active power", xlab = "" )
plot(time2, as.numeric(as.character(data1$Voltage)), type = "l", ylab = "Voltage", xlab = "datetime" )
plot(time2, as.numeric(as.character(data1$Sub_metering_1)), type = "l", ylab = "Energy sub metering", xlab = "")
lines(time2, as.numeric(as.character(data1$Sub_metering_2)), col = "red")
lines(time2, as.numeric(as.character(data1$Sub_metering_3)), col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red","blue"))
plot(time2, as.numeric(as.character(data1$Global_reactive_power)), type = "l", ylab = "Global_reactive_power", xlab = "datetime" )
dev.off()