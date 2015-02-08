library(data.table)
Sys.setlocale("LC_TIME", "English")

pre_table <- fread("household_power_consumption.txt", header=TRUE, na.strings="?")
target_table <- pre_table[(pre_table$Date == "1/2/2007" |  pre_table$Date == "2/2/2007"), ]

plot4_x <- strptime(paste(target_table$Date, target_table$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
plot4_1_y <- target_table$Global_active_power
plot4_2_y <- target_table$Voltage
plot4_3_y_1 <- target_table$Sub_metering_1
plot4_3_y_2 <- target_table$Sub_metering_2
plot4_3_y_3 <- target_table$Sub_metering_3
plot4_4_y <- target_table$Global_reactive_power

png("plot4.png", width = 504, height = 504, bg = "transparent", units = "px")
par(mfrow = c(2, 2), bg = "transparent")
plot(plot4_x, plot4_1_y, type = "l", ylab = "Global Active Power", xlab="")
plot(plot4_x, plot4_2_y, type = "l", ylab = "Voltage", xlab="datatime")
plot(plot4_x, plot4_3_y_1, type = "l", ylab = "Energy sub metering", xlab="")
lines(plot4_x, plot4_3_y_2, col = "red")
lines(plot4_x, plot4_3_y_3, col = "blue")
legend("topright", pch = "——", col = c("black", "red", "blue"), bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(plot4_x, plot4_4_y, type = "l", ylab = "Global_reactive_power", xlab="datatime")
dev.off()