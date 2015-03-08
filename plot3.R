
#read in data
power <- read.table("household_power_consumption.txt",header= TRUE,sep = ";",colClasses=c("character","character", "numeric","numeric","numeric","numeric", "numeric","numeric","numeric"), na.strings=c("NA", "?"))
power<-subset(power, Date == "1/2/2007" | Date == "2/2/2007")
power<-transform(power,Date = as.Date(Date,"%d/%m/%Y"), Time = strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"))

png("plot3.png", width = 480, height = 480) 

#plot3
plot(power$Time,power$Sub_metering_1, type="n",xlab = " ",ylab="Energy sub metering")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
lines(power$Time,power$Sub_metering_1,xlab = " ")
lines(power$Time,power$Sub_metering_2,xlab = " ",col="red")
lines(power$Time,power$Sub_metering_3,xlab = " ",col="blue")


dev.off()