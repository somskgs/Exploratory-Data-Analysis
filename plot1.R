###Name: Someshwar
###Week1- Project 1- Exploratory Data Analysis
###DataSet: Electric power consumption
###Description: Measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available. 
###Please save the R code in current working directory and ensure you have the data file household_power_consumption.txt in your working directory 

library(data.table)
dir<-getwd()
path<-paste(dir,sep="/","household_power_consumption.txt")
png("plot1.png",width=480,height=480,units = 'px')

electricdata<-read.table(path,skip = 66637,nrows=2880,sep=";",col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
electricdata$Date<-as.Date(electricdata$Date,format="%d/%m/%Y")
electricdata$Global_active_power<-as.numeric(electricdata$Global_active_power)
electricdata$Global_reactive_power<-as.numeric(electricdata$Global_reactive_power)
electricdata$Voltage<-as.numeric(electricdata$Voltage)
electricdata$Global_intensity<-as.numeric(electricdata$Global_intensity)
electricdata$Sub_metering_1<-as.numeric(electricdata$Sub_metering_1)
electricdata$Sub_metering_2<-as.numeric(electricdata$Sub_metering_2)

hist(electricdata$Global_active_power,main=("Global Active Power"),xlab="Global Active Power (kilowatts)",col="red")

dev.off()
