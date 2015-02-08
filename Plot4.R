
a <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
a$Date <- as.Date(a$Date, format = "%d/%m/%Y")

data <- subset(a,Date == "2007-02-01" |Date == "2007-02-02")

colnames(data)
data$Sub_metering_1<- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2<- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3<- as.numeric(as.character(data$Sub_metering_3))
data$Voltage<- as.numeric(as.character(data$Voltage))
data$Global_reactive_power<- as.numeric(as.character(data$Global_reactive_power))
png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))
plot(as.POSIXlt(paste(data$Date, data$Time, sep=" ")), data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(as.POSIXlt(paste(data$Date, data$Time, sep=" ")), data$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(as.POSIXlt(paste(data$Date, data$Time, sep=" ")), data$Sub_metering_1, type="l",xlab = "",ylab="Energy sub metering")
lines(as.POSIXlt(paste(data$Date, data$Time, sep=" ")), data$Sub_metering_2, type="l",col = "red")
lines(as.POSIXlt(paste(data$Date, data$Time, sep=" ")), data$Sub_metering_3, type="l",col = "blue")

legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty=c(1,1),cex=0.5)
plot(as.POSIXlt(paste(data$Date, data$Time, sep=" ")), data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
