##
## Coursera: Exploratory Data Analysis
## Course Project #1
## 
##      PLOT 3
##


## Read & process the file. 
## !! THE FILE MUST BE IN THE WORKING DIRECTORY !!
##
power <- read.table("household_power_consumption.txt", 
                    header=TRUE, 
                    sep=";", 
                    na.strings = "?", 
                    colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
)
power$Date <- as.Date(power$Date, format="%d/%m/%Y")                            ## convert date field
power <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]        ## subset for specific date range
power$Time <- as.POSIXct(paste(power$Date, power$Time))                         ## convert time field

## Create line plot PNG file with appropriate color and labels
## file is created in the current working directory

png(file = "plot3.png", bg = "transparent", height = 480, width=480)

plot(power$Time, power$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
points(power$Time, power$Sub_metering_1, col="black", type="l")
points(power$Time, power$Sub_metering_2, col="red", type="l")
points(power$Time, power$Sub_metering_3, col="blue", type="l")
legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"),  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
