#read in data
power <- read.table("household_power_consumption.txt",header= TRUE,sep = ";",colClasses=c("character","character", "numeric","numeric","numeric","numeric", "numeric","numeric","numeric"), na.strings=c("NA", "?"))
power<-subset(power, Date == "1/2/2007" | Date == "2/2/2007")
power<-transform(power,Date = as.Date(Date,"%d/%m/%Y"), Time = strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"))

#open plotting device
png("plot2.png", width = 480, height = 480)

#plot2
plot(power$Time,power$Global_active_power, type="n",xlab = " ",ylab="Global Active Power (kilowatts)")
lines(power$Time,power$Global_active_power)

dev.off()