#read in data
power <- read.table("household_power_consumption.txt",header= TRUE,sep = ";",colClasses=c("character","character", "numeric","numeric","numeric","numeric", "numeric","numeric","numeric"), na.strings=c("NA", "?"))
power<-subset(power, Date == "1/2/2007" | Date == "2/2/2007")
power<-transform(power,Date = as.Date(Date,"%d/%m/%Y"), Time = strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"))

#open plotting device
png("plot4.png", width = 480, height = 480)

#plot4
par(mfrow=c(2,2))

plot(power$Time,power$Global_active_power, type="n",xlab = " ",ylab="Global Active Power")
lines(power$Time,power$Global_active_power)

plot(power$Time,power$Voltage, type="n",xlab = "datetime",ylab="Voltage")
lines(power$Time,power$Voltage)


plot(power$Time,power$Sub_metering_1, type="n",xlab = " ",ylab="Energy sub metering")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c(1,2,4),lty=1,bty="n")
lines(power$Time,power$Sub_metering_1,xlab = " ")
lines(power$Time,power$Sub_metering_2,xlab = " ",col="red")
lines(power$Time,power$Sub_metering_3,xlab = " ",col="blue")


plot(power$Time,power$Global_reactive_power, type="n",xlab = "datetime",ylab="Global_reactive_power")
lines(power$Time,power$Global_reactive_power)

dev.off()