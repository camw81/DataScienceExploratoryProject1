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



#Plot 2

png( file = "plot2.png")
plot(as.numeric(as.character(use_data$Global_active_power)) ~ use_data$DateTime,
        ylab= "Global Active Power (Kilowatts)",
        xlab = "",
        type= 'l')
dev.off()




