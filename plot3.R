library(dplyr)
library(lubridate)
library(grDevices)
# the code to download and unzip file commented out 
#URL = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#download.file(URL, destfile = "exdata_date_household_power_consumption.zip", method="curl")
#unzip("exdata_date_household_power_consumption.zip")
#download.file(URL, destfile = "./data/data.csv", method="curl")
mydf<-read.table(file="household_power_consumption.txt",sep=";",header=TRUE,,stringsAsFactors=FALSE)
mydf1<-tbl_df(mydf)
cleaned<- mutate(mydf1,fdate=dmy_hms(paste(Date,Time,sep=" ")),dt=wday(fdate), Global_active_power=as.numeric(Global_active_power),Sub_metering_1=as.numeric(Sub_metering_1),Sub_metering_1=as.numeric(Sub_metering_1),Sub_metering_1=as.numeric(Sub_metering_1))%>%
filter(fdate>=ymd("2007-02-01"),fdate<ymd("2007-02-03"))
png(filename="plot3.png")
with(cleaned,plot(fdate,Sub_metering_1,ylab="Energy sub metering",type="n"))
with(cleaned,lines(cleaned$fdate,cleaned$Sub_metering_1,col="black"))
with(cleaned,lines(cleaned$fdate,cleaned$Sub_metering_2,col="red"))
with(cleaned,lines(cleaned$fdate,cleaned$Sub_metering_3,col="blue"))
legend("topright", lty=1,col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()

