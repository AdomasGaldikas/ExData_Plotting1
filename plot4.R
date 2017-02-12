## Exploratory Data Analysis
## Author: Adomas Galdikas
## Data file: household_power_consumption.txt

library(dplyr)
library(lubridate)

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

#You may find it useful to convert the Date and Time variables to Date/Time classes in R using the strptime()  and as.Date() functions.
data<-mutate(data, datetime=dmy_hms(paste(data$Date, data$Time)))

## Open PNG device; create 'plot4.png' in my working directory 
png(file = "plot4.png") 

par(mfrow = c(2, 2), mar = c(5, 4, 2, 1))

# Plot 1
plot(data$Global_active_power~data$datetime, type="l", ylab = "Global Active Power", xlab="")

# Plot 2
plot(data$Voltage~data$datetime, type="l", ylab = "Voltage", xlab="datetime")

# Plot 3
with(data, plot(Sub_metering_1 ~ datetime, type = "n", ylab="Energy sub metering", xlab="")) 
with(data, points(Sub_metering_1 ~ datetime, type="l", col="black"))
with(data, points(Sub_metering_2 ~ datetime, type="l", col="red"))
with(data, points(Sub_metering_3 ~ datetime, type="l", col="blue"))
legend("topright", lty = c(1,1,1), bty="n", col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Plot 4
plot(data$Global_reactive_power~data$datetime, type="l", ylab = "Global_reactive_power", xlab="datetime")

## Close the PNG file device 
dev.off()



