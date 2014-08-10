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

#Drawing plot3.png
png("plot3.png")
plot(hpc$Date,type="l",hpc$Sub_metering_1, xlab = "",ylab="Energy sub metering")
lines(hpc$Date,hpc$Sub_metering_2,col=2)
lines(hpc$Date,hpc$Sub_metering_3,col=4)
legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c("black","red","blue"))
dev.off()