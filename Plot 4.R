setwd("~/Data Science Specialization/ Exploratory Data Analysis")

##Read in the Data

power_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

##Convert the Date column from a factor to POSIX1t (Date)

power_data$Date <- strptime( x= as.character(power_data$Date),
                             format = "%d/%m/%Y")

##Subset the dataset for two days in Feb. 2007

use_data <- subset(power_data, as.Date(power_data$Date) >= "2007-02-01" & as.Date(power_data$Date) <= "2007-02-02")

##Combine the Day and Time Column into a DateTime column column from a factor to a POSIX1t

use_data$DateTime <- with(use_data, paste(Date, Time))

use_data$DateTime <- as.POSIXct(use_data$DateTime)


##Convert sub-metering to numeric

use_data$Sub_metering_1 <- as.numeric(use_data$Sub_metering_1)
use_data$Sub_metering_2 <- as.numeric(use_data$Sub_metering_2)
use_data$Sub_metering_3 <- as.numeric(use_data$Sub_metering_3)

##Convert Global Reactive and Global Active

use_data$Global_active_power <- as.character(as.numeric(use_data$Global_active_power))
use_data$Global_reactive_power <- as.character(as.numeric(use_data$Global_reactive_power))
use_data$Voltage <- as.character(as.numeric(use_data$Voltage))

#Plot 4

plot.new()


par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
png(file = "plot4.png")
with(use_data, {
    plot(Global_active_power ~ DateTime, type = "l", 
         ylab = "Global Active Power", xlab = "")
    plot(Sub_metering_1 ~ DateTime, type = "l", ylab = "Energy sub metering",
         xlab = "")
    lines(Sub_metering_2 ~ DateTime, col = 'Red')
    lines(Sub_metering_3 ~ DateTime, col = 'Blue')
    legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
           bty = "n",
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Voltage ~ DateTime, type = "l", ylab = "Voltage", xlab = "datetime")
    plot(Global_reactive_power ~ DateTime, type = "l", 
         ylab = "Global_reactive_power", xlab = "datetime")
})
    dev.off()




