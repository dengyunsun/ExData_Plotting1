## Project1, plot1

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

png("Plot1.png",bg="white")
hist(data2$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
