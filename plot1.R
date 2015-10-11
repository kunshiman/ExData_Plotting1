data <- read.table("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, header = TRUE)
# just the specific date
dataproject <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
# make the graph
dataproject$Date <- as.Date(dataproject$Date, format = "%d/%m/%Y")
dataproject$Global_active_power <- as.numeric(dataproject$Global_active_power) # as hist function needs numeric 
hist(dataproject$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# make png
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()