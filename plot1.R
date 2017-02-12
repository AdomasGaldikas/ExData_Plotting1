## Exploratory Data Analysis
## Author: Adomas Galdikas
## Data file: household_power_consumption.txt

# We will only be using data from the dates 2007-02-01 and 2007-02-02.
# Lines in use 66638-69517
# Note that in this dataset missing values are coded as ?.
data <- read.table("household_power_consumption.txt",
                   sep=";", 
                   nrows=2880,
                   skip=66637,
                   na.strings = "?", 
                   col.names = c("Date",
                                 "Time",
                                 "Global_active_power",
                                 "Global_reactive_power",
                                 "Voltage",
                                 "Global_intensity",
                                 "Sub_metering_1",
                                 "Sub_metering_2",
                                 "Sub_metering_3")
                   )


## Open PNG device; create 'plot1.png' in my working directory 
png(file = "plot1.png") 
hist(data$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
## Close the PNG file device 
dev.off()

