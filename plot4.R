data <- read.table("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, header = TRUE)
# just the specific date
dataproject <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
dataproject$Date <- as.Date(dataproject$Date, format = "%d/%m/%Y")

datewithtime <- paste(dataproject$Date, dataproject$Time, sep = " ")
dataproject$datewithtime <- as.POSIXct(datewithtime)
dataproject$Global_active_power <- as.numeric(dataproject$Global_active_power)
dataproject$Voltage <- as.numeric(dataproject$Voltage)
dataproject$Global_reactive_power <- as.numeric(dataproject$Global_reactive_power)
dataproject$Sub_metering_1 <- as.numeric(dataproject$Sub_metering_1)
dataproject$Sub_metering_2 <- as.numeric(dataproject$Sub_metering_2)
dataproject$Sub_metering_3 <- as.numeric(dataproject$Sub_metering_3)

# plot4
dev.copy(png, file = "plot4.png", height = 480, width = 480)
par(mfrow = c(2, 2)) 
# plot4.1
plot(dataproject$datewithtime, dataproject$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power", cex.axis = 0.75)
# plot4.2
plot(dataproject$datewithtime, dataproject$Voltage, type = "l", xlab = "datetime", ylab = "Voltage", cex.axis = 0.75)
# plot 4.3
plot(dataproject$datewithtime, dataproject$Sub_metering_1, type = "l", ylab = "Energy Submetering", xlab = "", cex.axis = 0.75)
lines(dataproject$datewithtime, dataproject$Sub_metering_2, col = "red")
lines(dataproject$datewithtime, dataproject$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 2, col = c("black", "red", "blue"), bty = "n", cex = 0.7)
# plot 4.4
plot(dataproject$datewithtime, dataproject$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power", cex.axis = 0.75)


dev.off()