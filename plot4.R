# Download data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "../hpc.zip")

# UNZIP
unzip("../hpc.zip",exdir="..")

# Read the dataset
data <- read.csv("../household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Filter for the 2 days in feb
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
d <- subset(data, DateTime >= "2007-02-01" & DateTime < "2007-02-03")

# draw the plot
png("plot4.png", width=480, height = 480)
par(mfrow=c(2,2))
plot(d$DateTime, d$Global_active_power, type = "l", ylab="Global Active Power", xlab="")
plot(d$DateTime, d$Voltage, type = "l", ylab="Voltage", xlab="datetime")
plot(d$DateTime, d$Sub_metering_1, type = "l", ylab="Energy sub metering", xlab="")
lines(d$DateTime, d$Sub_metering_2, col="red")
lines(d$DateTime, d$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black","red", "blue"), bty="n")
plot(d$DateTime, d$Global_reactive_power, type = "l", ylab="Global_reactive_power", xlab="datetime")
dev.off()
