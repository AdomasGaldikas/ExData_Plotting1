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

## Open PNG device; create 'plot3.png' in my working directory 
png(file = "plot3.png") 
with(data, plot(Sub_metering_1 ~ datetime, type = "n", ylab="Energy sub metering", xlab="")) 
with(data, points(Sub_metering_1 ~ datetime, type="l", col="black"))
with(data, points(Sub_metering_2 ~ datetime, type="l", col="red"))
with(data, points(Sub_metering_3 ~ datetime, type="l", col="blue"))
legend("topright", lty = c(1,1,1), col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


## Close the PNG file device 
dev.off()



