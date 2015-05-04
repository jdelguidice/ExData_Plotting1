##
## Coursera: Exploratory Data Analysis
## Course Project #1
## 
##      PLOT 2
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

## Create Histogram PNG file with appropriate color and labels
## file is created in the current working directory

png(file = "plot2.png", bg = "transparent", height = 480, width=480)
plot(power$Time, power$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
