## Plot4

# Reading data
file <- "household_power_consumption.txt"
data <- read.csv(file=file, header=TRUE, sep=";", na.strings="?")\

# Select dates
data <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]

# create new column Data/Time
data$Timestamp <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

# make screen 4 graph
png(file="plot4.png")
par(mfcol = c(2, 2))

with(data, {
  
# LEFT_TOP - Global Active Power Graph
Sys.setlocale("LC_TIME", "English")
plot(x=Timestamp, y=Global_active_power, type="l", xlab="", ylab="Global Active Power")

# RIGHT_TOP - Energy sub mettering Graph
plot(x=Timestamp, y=Sub_metering_1, col="black", type="l", xlab="", ylab="Energy sub mettering")
lines(x=Timestamp, y=Sub_metering_2, col="red")
lines(x=Timestamp, y=Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c("black", "red", "blue"), bty = "n")


# LEFT_BOTTOM - Voltage Graph
plot(x=Timestamp, y=Voltage, type="l", xlab="datetime", ylab="Voltage")

# RIGHT_BOTTOM - Global Reactive Power Graph
plot(x=Timestamp, y=Global_reactive_power, type="l", xlab="datetime")

})

dev.off()
