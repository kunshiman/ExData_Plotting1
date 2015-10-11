data <- read.table("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, header = TRUE)
# just the specific date
dataproject <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
dataproject$Date <- as.Date(dataproject$Date, format = "%d/%m/%Y")
# make column with merged date and time
datewithtime <- paste(dataproject$Date, dataproject$Time, sep = " ")
dataproject$datewithtime <- as.POSIXct(datewithtime)
dataproject$Global_active_power <- as.numeric(dataproject$Global_active_power)
dataproject$Sub_metering_1 <- as.numeric(dataproject$Sub_metering_1)
dataproject$Sub_metering_2 <- as.numeric(dataproject$Sub_metering_2)
dataproject$Sub_metering_3 <- as.numeric(dataproject$Sub_metering_3)
# make plot
plot(dataproject$datewithtime, dataproject$Sub_metering_1, type = "l", ylab = "Energy Submetering", xlab = "")
lines(dataproject$datewithtime, dataproject$Sub_metering_2, col = "red")
lines(dataproject$datewithtime, dataproject$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, col = c("black", "red", "blue"))

dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()