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


#plot 2
with(xdata,plot(Global_active_power~DateTime,
                type="l",
                xlab="",
                ylab="Global Active Power (kilowatts)"))
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

