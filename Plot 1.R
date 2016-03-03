setwd("~/Data Science Specialization/ Exploratory Data Analysis")

##Read in the Data

power_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

##Convert the Date column from a factor to POSIX1t (Date)

power_data$Date <- strptime( x= as.character(power_data$Date),
                             format = "%d/%m/%Y")
##Subset the dataset for two days in Feb. 2007

use_data <- subset(power_data, as.Date(power_data$Date) >= "2007-02-01" & as.Date(power_data$Date) <= "2007-02-02")


#Plot 1

png(file = "plot1.png")
hist(as.numeric(as.character(use_data$Global_active_power)), xlab = "Global Active Power (kilowatts)",
        col = "red",
        main = "Global Active Power",
        ylim = c(0,1200))
        dev.off()
        
Global_Active_Power



