library(dplyr)

setwd("C:\\Amit\\Data Analysis\\Coursera\\Exploratory DA\\Week 1\\Data")

power_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

power_data_filtered <- filter(power_data, (Date == "1/2/2007" | Date == "2/2/2007") & Global_active_power != "?")

datetime <- strptime(paste(power_data_filtered$Date, power_data_filtered$Time, sep = " "), "%d/%m/%Y %H:%M:%S") 

GLobal_active_power_num = as.numeric(power_data_filtered$Global_active_power)

png("plot2.png", width=480, height=480)

plot(datetime, GLobal_active_power_num, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()