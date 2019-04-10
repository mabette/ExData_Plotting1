setwd("~/Desktop/Data Science")
# reading the file
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259)
# selecting files based on dates
data_selected <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
data_selected$Date <- as.Date(data_selected$Date, format="%d/%m/%Y")
# plotting the histogram
hist(data_selected$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
# saving the plot
png("plot1.png", width=480, height=480)
dev.off()