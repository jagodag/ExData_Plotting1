
a <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
a$Date <- as.Date(a$Date, format = "%d/%m/%Y")
data <- subset(a,Date == "2007-02-01" |Date == "2007-02-02")

data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
hist(data$Global_active_power, xlab = "Global Active Power ( kilowatts)", main = "Global Active Power", col = "red")


dev.copy(png,file = "plot1.png", width = 480, height = 480)
dev.off()
