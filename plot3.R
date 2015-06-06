rm(list=ls())
path<-"C:/Users/Matthew/Documents/MyDocuments/Coursera/EDA"
getwd()
setwd(path)

library(lubridate)

data<-read.table(file="household_power_consumption.txt",sep=c(";","."),
                 header=T,na.strings="?")

data$Date<-dmy(data$Date)

str(data)

xdata<-data
xdata$Date<-as.Date(xdata$Date)
xdata<-xdata[xdata$Date=="2007-02-01" | xdata$Date=="2007-02-02",]

xdata$DateTime <- paste(xdata$Date, xdata$Time)
xdata$DateTime <- as.POSIXct(xdata$DateTime)

#plot 3

with(xdata,{plot(Sub_metering_1~DateTime,
                 type="l",
                 xlab="",
                 ylab="Energy sub setering")
            lines(Sub_metering_2~DateTime,
                  col="red")
            lines(Sub_metering_3~DateTime,
                  col="blue")})
legend("topright",
       lty=1,
       col=c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()