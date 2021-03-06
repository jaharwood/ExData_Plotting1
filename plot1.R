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
hist(data2$Global_active_power, col = "red", main = paste("Global Active Power"), xlab = "Global Active Power (kilowatts)")
dev.copy(png,'plot1.png')
dev.off()
