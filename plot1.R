## Plot1

# Reading data
file <- "household_power_consumption.txt"
data <- read.csv(file=file, header=TRUE, sep=";", na.strings="?")\

# Select dates
data <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]

# create new column Data/Time
data$Timestamp <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

# make histogram to png file
png(file="plot1.png")
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
