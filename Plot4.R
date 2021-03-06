## Project1, plot4

data=read.table(file="household_power_consumption.txt",sep=";", header=TRUE)
data$Date=as.Date(data$Date,format="%d/%m/%Y")
sub=subset(data, Date==as.Date("2007-02-01")|Date==as.Date("2007-02-02"))

#Format Time variable to POSIXlt format
a=paste(as.character(sub$Date),as.character(sub$Time),sep=" ")
b=strptime(a,format="%Y-%m-%d %H:%M")
sub$Time=b

for (i in 3:9){
sub[,i]=as.numeric(as.character(sub[,i]))
}

data2=sub

png("Plot4.png",bg="white")
par(mfrow=c(2,2))
plot(data2$Time,data2$Global_active_power,ylab="Global Active Power (kilowatts)",type="l",xlab="")
plot(data2$Time,data2$Voltage,ylab="Voltage",type="l",xlab="datetime")
plot(data2$Time,data2$Sub_metering_1,ylab="Energy sub metering",type="l",xlab="")
plot.xy(xy.coords(data2$Time,data2$Sub_metering_2),type="l",col="red")
plot.xy(xy.coords(data2$Time,data2$Sub_metering_3),type="l",col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
plot(data2$Time,data2$Global_reactive_power,ylab="Global_reactive_power",type="l",xlab="datetime")
dev.off()
