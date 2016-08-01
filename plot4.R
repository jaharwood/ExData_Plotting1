## Exploratory Data Analysis

# Set working directory
setwd("~/Documents/Git/ExData_Plotting1/")

# Read in the data
data <- read.csv("~/Downloads/household_power_consumption.txt", header = T, sep = ';', 
                 na.strings = "?", nrows = 2075259, check.names = F, 
                 stringsAsFactors = F, comment.char = "", quote = '\"')

# Fix Dates
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset Data
data2 <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)
datetime <- paste(as.Date(data2$Date), data2$Time)
data2$Datetime <- as.POSIXct(datetime)

# Plot
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(data2, {
  plot(Global_active_power ~ Datetime, type = "l", 
       ylab = "Global Active Power", xlab = "")
  plot(Voltage ~ Datetime, type = "l", ylab = "Voltage", xlab = "datetime")
  plot(Sub_metering_1 ~ Datetime, type = "l", ylab = "Energy sub metering",
       xlab = "")
  lines(Sub_metering_2 ~ Datetime, col = 'Red')
  lines(Sub_metering_3 ~ Datetime, col = 'Blue')
  legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
         bty = "n",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power ~ Datetime, type = "l", 
       ylab = "Global_rective_power", xlab = "datetime")
})

dev.copy(png,'plot4.png')
dev.off()
