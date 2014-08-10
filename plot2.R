#Copy the text file to your wd (check with getwd())
data <- "./household_power_consumption.txt"

#Reading the dates from 2007-02-01 & 2007-02-02
firstRow_1_2_2007 <- 66637
lastRow_2_2_2007 <- 69517
nRow_dif <- lastRow_2_2_2007 - firstRow_1_2_2007
hpc <- read.table(data,sep=";", header=FALSE, na.strings="?",skip =firstRow_1_2_2007, nrows = nRow_dif)

#Set names
names(hpc) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#Code for reading data
hpc$Date<- as.POSIXct(strptime(paste(hpc$Date,hpc$Time), "%d/%m/%Y %H:%M:%S"))

#Drawing plot2.png
png("plot2.png")
plot(hpc$Date,hpc$Global_active_power,type="l",xlab = "",ylab="Global Active Power (kilowatts)")
dev.off()