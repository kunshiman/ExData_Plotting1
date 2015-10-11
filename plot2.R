data <- read.table("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, header = TRUE)
# just the specific date
dataproject <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
dataproject$Date <- as.Date(dataproject$Date, format = "%d/%m/%Y")
# make column with merged date and time
datewithtime <- paste(dataproject$Date, dataproject$Time, sep = " ")
dataproject$datewithtime <- as.POSIXct(datewithtime)
# plot it
plot(dataproject$datewithtime, dataproject$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()

