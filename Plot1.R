library(dplyr)

setwd("C:\\Amit\\Data Analysis\\Coursera\\Exploratory DA\\Week 1\\Data")

power_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

power_data_filtered <- filter(power_data, (Date == "1/2/2007" | Date == "2/2/2007") & Global_active_power != "?")

# below piece of code generates the histogram for Global Active Poer
GLobal_active_power_num = as.numeric(power_data_filtered$Global_active_power)

png("plot1.png", width=480, height=480)

hist(GLobal_active_power_num, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()
