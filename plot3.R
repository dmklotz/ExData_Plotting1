dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
bloop <- subset(dat, Date == "1/2/2007" | Date == "2/2/2007")
bloop$Date <- as.Date(bloop$Date, format = "%d/%m/%Y")
bloop$timetemp <- paste(bloop$Date, bloop$Time)
bloop$Time <- strptime(bloop$timetemp, format = "%Y-%m-%d %H:%M:%S")

png(filename = "plot3.png", width = 480, height = 480)
with(bloop, {
  plot(Time, Sub_metering_1, type = "l", xlab = " ", ylab = "Energy sub metering")
  lines(Time, Sub_metering_2, col = "red")
  lines(Time, Sub_metering_3, col = "blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"))
})
dev.off()
