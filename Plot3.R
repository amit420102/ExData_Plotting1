library(dplyr)

setwd("C:\\Amit\\Data Analysis\\Coursera\\Exploratory DA\\Week 1\\Data")

power_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, dec = ".")

power_data_filtered <- filter(power_data, (Date == "1/2/2007" | Date == "2/2/2007") & Global_active_power != "?")

datetime <- strptime(paste(power_data_filtered$Date, power_data_filtered$Time, sep = " "), "%d/%m/%Y %H:%M:%S") 

Sub_metering_1_num <- as.numeric(power_data_filtered$Sub_metering_1)
Sub_metering_2_num <- as.numeric(power_data_filtered$Sub_metering_2)
Sub_metering_3_num <- as.numeric(power_data_filtered$Sub_metering_3)

print(power_data_filtered$Sub_metering_1)
print(Sub_metering_1_num)

png("plot3.png", width=480, height=480)

plot(datetime, Sub_metering_1_num, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, Sub_metering_2_num, type="l", col="red")
lines(datetime, Sub_metering_3_num, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()