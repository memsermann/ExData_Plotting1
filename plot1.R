#read in data
power<-read.table("household_power_consumption.txt",header= TRUE,sep = ";",colClasses=c("character","character", "numeric","numeric","numeric","numeric", "numeric","numeric","numeric"), na.strings=c("NA", "?"))
power<-subset(power, Date == "1/2/2007" | Date == "2/2/2007")
power<-transform(power,Date = as.Date(Date,"%d/%m/%Y"), Time = strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"))

#open plotting device
png("plot1.png", width = 480, height = 480)

#plot1
hist(power$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

dev.off()