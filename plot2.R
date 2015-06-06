## Plot2

# Reading data
file <- "household_power_consumption.txt"
data <- read.csv(file=file, header=TRUE, sep=";", na.strings="?")\

# Select dates
data <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]

# create new column Data/Time
data$Timestamp <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

# make time plot to png file
png(file="plot2.png")
Sys.setlocale("LC_TIME", "English")
plot(x=data$Timestamp, y=data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
