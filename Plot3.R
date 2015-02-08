
a <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
a$Date <- as.Date(a$Date, format = "%d/%m/%Y")
data <- subset(a,Date == "2007-02-01" |Date == "2007-02-02")


colnames(data)
data$Sub_metering_1<- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2<- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3<- as.numeric(as.character(data$Sub_metering_3))


plot(as.POSIXlt(paste(data$Date, data$Time, sep=" ")), data$Sub_metering_1, type="l",xlab = "",ylab="Energy sub metering")
lines(as.POSIXlt(paste(data$Date, data$Time, sep=" ")), data$Sub_metering_2, type="l",col = "red")
lines(as.POSIXlt(paste(data$Date, data$Time, sep=" ")), data$Sub_metering_3, type="l",col = "blue")

legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty=c(1,1), cex = 0.5)



png("plot3.png", width=480, height=480)


plot(as.POSIXlt(paste(data$Date, data$Time, sep=" ")), data$Sub_metering_1, type="l",xlab = "",ylab="Energy sub metering")
lines(as.POSIXlt(paste(data$Date, data$Time, sep=" ")), data$Sub_metering_2, type="l",col = "red")
lines(as.POSIXlt(paste(data$Date, data$Time, sep=" ")), data$Sub_metering_3, type="l",col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty=c(1,1))


dev.off()
