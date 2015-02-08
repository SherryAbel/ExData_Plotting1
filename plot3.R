library(data.table)
Sys.setlocale("LC_TIME", "English")
pre_table <- fread("household_power_consumption.txt", header=TRUE, na.strings="?")
target_table <- pre_table[(pre_table$Date == "1/2/2007" |  pre_table$Date == "2/2/2007"), ]

plot3_x <- strptime(paste(target_table$Date, target_table$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
plot3_y_1 <- target_table$Sub_metering_1
plot3_y_2 <- target_table$Sub_metering_2
plot3_y_3 <- target_table$Sub_metering_3

png("plot3.png", width = 504, height = 504, bg = "transparent")
plot(plot3_x, plot3_y_1, type = "l", ylab = "Energy sub metering", xlab="")
lines(plot3_x, plot3_y_2, col = "red")
lines(plot3_x, plot3_y_3, col = "blue")
legend("topright", pch = "——", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()