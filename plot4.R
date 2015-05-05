##
## Coursera: Exploratory Data Analysis
## Course Project #1
## 
##      PLOT 4
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

png(file = "plot4.png", bg = "transparent", height = 480, width=480)

#Set the 2 x 2 grid
par(mfrow = c(2, 2))

#plot first (top left)
plot(power$Time, power$Global_active_power, type="l", ylab="Global Active Power", xlab="")

#plot second (top right)
plot(power$Time, power$Voltage, type="l", ylab="Voltage", xlab="datetime")

#plot third (bottom left)
plot(power$Time, power$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
points(power$Time, power$Sub_metering_1, col="black", type="l")
points(power$Time, power$Sub_metering_2, col="red", type="l")
points(power$Time, power$Sub_metering_3, col="blue", type="l")
legend("topright", lty = c(1,1,1), bty="n", col = c("black", "red", "blue"),  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#plot fourth (bottom right)
plot(power$Time, power$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")


dev.off()
