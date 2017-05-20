# Download data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "../hpc.zip")

# UNZIP
unzip("../hpc.zip",exdir="..")

# Read the dataset
data <- read.csv("../household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Filter for the 2 days in feb
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
d <- subset(data, DateTime >= "2007-02-01" & DateTime < "2007-02-03")

# draw the histogram
png("plot1.png", width=480, height = 480)
hist(d$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
