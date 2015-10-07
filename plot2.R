dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
bloop <- subset(dat, Date == "1/2/2007" | Date == "2/2/2007")
bloop$Date <- as.Date(bloop$Date, format = "%d/%m/%Y")
bloop$timetemp <- paste(bloop$Date, bloop$Time)
bloop$Time <- strptime(bloop$timetemp, format = "%Y-%m-%d %H:%M:%S")

png(filename = "plot2.png", width = 480, height = 480)
with(bloop, plot(Time, Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)"))
dev.off()
