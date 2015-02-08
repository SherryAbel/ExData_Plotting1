library(data.table)
Sys.setlocale("LC_TIME", "English")
pre_table <- fread("household_power_consumption.txt", header=TRUE, na.strings="?")
target_table <- pre_table[(pre_table$Date == "1/2/2007" |  pre_table$Date == "2/2/2007"), ]

plot1 <- as.numeric(target_table$Global_active_power)
hist(plot1, freq = TRUE, col = "red", xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power", bg="transparent")
dev.copy(png, file = "plot1.png")
dev.off()
