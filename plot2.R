setwd("~/Desktop/Data Science")
# reading the file
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259)
# selecting files based on dates
data_selected <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
data_selected$Date <- as.Date(data_selected$Date, format="%d/%m/%Y")
timing <- paste(as.Date(data_selected$Date), data_selected$Time)
# converting classes
data_selected$Timing <- as.POSIXct(timing)
# plotting data
with(data_selected, {plot(Global_active_power~Timing, type="l", ylab="Global Active Power (kilowatts)", xlab="")})
# saving the plot
png("plot2.png", width=480, height=480)
dev.off()