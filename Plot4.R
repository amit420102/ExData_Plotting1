library(dplyr)

setwd("C:\\Amit\\Data Analysis\\Coursera\\Exploratory DA\\Week 1\\Data")

power_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, dec = ".")

power_data_filtered <- filter(power_data, (Date == "1/2/2007" | Date == "2/2/2007") & Global_active_power != "?")

datetime <- strptime(paste(power_data_filtered$Date, power_data_filtered$Time, sep = " "), "%d/%m/%Y %H:%M:%S") 

GLobal_active_power_num <- as.numeric(power_data_filtered$Global_active_power)

Global_reactive_power_num <- as.numeric(power_data_filtered$Global_reactive_power)

Voltage_num <- as.numeric(power_data_filtered$Voltage)

Sub_metering_1_num <- as.numeric(power_data_filtered$Sub_metering_1)
Sub_metering_2_num <- as.numeric(power_data_filtered$Sub_metering_2)
Sub_metering_3_num <- as.numeric(power_data_filtered$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, GLobal_active_power_num, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, Voltage_num, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, Sub_metering_1_num, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, Sub_metering_2_num, type="l", col="red")
lines(datetime, Sub_metering_3_num, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, Global_reactive_power_num, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()