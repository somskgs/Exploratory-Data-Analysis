###Name: Someshwar
###Week1- Project 1- Exploratory Data Analysis
###DataSet: Electric power consumption
###Description: Measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available. 
###Please save the R code in current working directory and ensure you have the data file household_power_consumption.txt in your working directory 

library(data.table)
library(lubridate)
dir<-getwd()
path<-paste(dir,sep="/","household_power_consumption.txt")
electricdata<-read.table(path,skip = 66637,nrows=2880,sep=";",col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
electricdata$Date<-as.Date(electricdata$Date,format="%d/%m/%Y")
electricdata$Global_active_power<-as.numeric(electricdata$Global_active_power)
electricdata$Global_reactive_power<-as.numeric(electricdata$Global_reactive_power)
electricdata$Voltage<-as.numeric(electricdata$Voltage)
electricdata$Global_intensity<-as.numeric(electricdata$Global_intensity)
electricdata$Sub_metering_1<-as.numeric(electricdata$Sub_metering_1)
electricdata$Sub_metering_2<-as.numeric(electricdata$Sub_metering_2)

png(filename="plot4.png",width=480,height=480,units="px")
par(mfrow=c(2,2))

##Plot topleft
with(electricdata,plot(Global_active_power,type="l",xaxt="n",xlab="",ylab="Global Active Power"))
pos1<-length(electricdata[electricdata$Date=="2007-02-01","Date"])
pos1<-pos1+1
endpos<-length(electricdata$Global_active_power)
axis(1,at=c(1,pos1,endpos),c("Thu","Fri","Sat"))

##plot topright
with(electricdata,plot(Voltage,type="l",xaxt="n",xlab="datetime",ylab="Voltage"))
axis(1,at=c(1,pos1,endpos),c("Thu","Fri","Sat"))

##Plot bottomleft
with(electricdata,plot(Sub_metering_1,type="l",xaxt="n",col="Black",ylab="Energy sub metering"))
with(electricdata,points(Sub_metering_2,type="l",col="red"))
with(electricdata,points(Sub_metering_3,type="l",col="blue"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1))
axis(1,at=c(1,pos1,endpos),c("Thu","Fri","Sat"))

##Plot bottomright
with(electricdata,plot(Global_reactive_power,type="l",xaxt="n",xlab="datetime",ylab="Global_reactive_power"))
axis(1,at=c(1,pos1,endpos),c("Thu","Fri","Sat"))
dev.off()
