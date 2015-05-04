##
## Coursera: Exploratory Data Analysis
## Course Project #1
## 
##      PLOT 1
##


## Read & process the file. THE FILE MUST BE IN THE WORKING DIRECTORY
power <- read.table("household_power_consumption.txt", 
                header=TRUE, 
                sep=";", 
                na.strings = "?", 
                colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
                )
power$Date <- as.Date(power$Date, format="%d/%m/%Y")                            ## convert date field
power$time <- strptime(power$Time, "%H:%M:%S")                                  ## convert time field

power <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]        ## subset for specific date range

## Create Histogram PNG file with appropriate color and labels
png(file = "plot1.png", bg = "transparent", height = 480, width=480)
hist(power$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

