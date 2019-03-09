library(sqldf)
setwd("/Users/xuy089/Downloads")
data<- read.csv.sql("household_power_consumption.txt","select * from file where Date = '1/2/2007' or Date = '2/2/2007'", sep = ";")
data$Date<-as.Date(data$Date,format = "%d/%m/%Y")
data$date_time<-with(data,paste(Date,Time))
data$date_time<-strptime(data$date_time,format = "%Y-%m-%d %H:%M:%S",tz = "")

with(data,plot(date_time,Sub_metering_1,type="l",col="black",ylab = "Energy sub metering",xlab=""))
 lines(data$date_time,data$Sub_metering_2,col="red")
 lines(data$date_time,data$Sub_metering_3,col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)

dev.copy(png,file= "plot3.png",width = 480, height = 480, units = "px")
dev.off()
