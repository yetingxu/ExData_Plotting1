library(sqldf)
setwd("/Users/xuy089/Downloads")
data<- read.csv.sql("household_power_consumption.txt","select * from file where Date = '1/2/2007' or Date = '2/2/2007'", sep = ";")
data$Date<-as.Date(data$Date,format = "%d/%m/%Y")
data$date_time<-with(data,paste(Date,Time))
data$date_time<-strptime(data$date_time,format = "%Y-%m-%d %H:%M:%S",tz = "")

with(data,plot(date_time,Global_active_power,type="l",ylab = "Global Active Power (kilowatts)"))

dev.copy(png,file= "plot2.png",width = 480, height = 480, units = "px")
dev.off()
