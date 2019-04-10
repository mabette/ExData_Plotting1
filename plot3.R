setwd("~/Desktop/Data Science")
# reading the file
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259)
# selecting files based on dates
data_selected <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
data_selected$Date <- as.Date(data_selected$Date, format="%d/%m/%Y")
timing <- paste(as.Date(data_selected$Date), data_selected$Time)
# converting classes
data_selected$Timing <- as.POSIXct(timing)
# opening PNG file
png("plot3.png", width=480, height=480)
# plotting data
with(data_selected, {plot(Sub_metering_1~Timing, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Timing,col='Red')
  lines(Sub_metering_3~Timing,col='Blue')})
# setting-up legend
legend("topright", col=c("black", "red", "blue"),lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# closing file
dev.off()
