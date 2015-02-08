library(data.table)
Sys.setlocale("LC_TIME", "English")
pre_table <- fread("household_power_consumption.txt", header=TRUE, na.strings="?")
target_table <- pre_table[(pre_table$Date == "1/2/2007" |  pre_table$Date == "2/2/2007"), ]

plot2_x <- strptime(paste(target_table$Date, target_table$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
plot2_y <- target_table$Global_active_power
plot(plot2_x, plot2_y, type = "l", ylab = "Global Active Power (kilowatts)", xlab="")
dev.copy(png, file = "plot2.png")
dev.off()