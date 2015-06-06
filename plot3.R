## Plot3

# Reading data
file <- "household_power_consumption.txt"
data <- read.csv(file=file, header=TRUE, sep=";", na.strings="?")\

# Select dates
data <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]

# create new column Data/Time
data$Timestamp <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

# make subEnergy / time plot to png file
png(file="plot3.png")
Sys.setlocale("LC_TIME", "English")
with(data, plot(x=Timestamp, y=Sub_metering_1, col="black", type="l", xlab="", ylab="Energy sub mettering"))
with(data, lines(x=Timestamp, y=Sub_metering_2, col="red"))
with(data, lines(x=Timestamp, y=Sub_metering_3, col="blue"))
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()
