library(dplyr)
library(lubridate)

setwd("C:\\Amit\\Data Analysis\\Coursera\\Exploratory DA\\Week 1\\Data")

power_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

power_data_filtered <- filter(power_data, (Date == "1/2/2007" | Date == "2/2/2007") & Global_active_power != "?")

# below piece of code generates the histogram for Global Active Poer
power_data_filtered <- mutate(power_data_filtered, GLobal_active_power_num = as.numeric(Global_active_power))

png("plot1.png", width=480, height=480)
hist(power_data_filtered$GLobal_active_power_num, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

# below generates second plot
power_data_filtered <- mutate(power_data_filtered,GLobal_active_power_num = as.numeric(Global_active_power), Date_format = weekdays(as.Date(parse_date_time(power_data_filtered$Date, orders = "dmy"))))
with(power_data_filtered, plot(Date_format, GLobal_active_power_num))