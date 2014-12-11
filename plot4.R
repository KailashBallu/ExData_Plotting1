library(dplyr)
library(lubridate)
library(grDevices)
# the code to download and unzip file commented out 
#URL = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#download.file(URL, destfile = "exdata_date_household_power_consumption.zip", method="curl")
#unzip("exdata_date_household_power_consumption.zip")

mydf<-read.table(file="household_power_consumption.txt",sep=";",header=TRUE,,stringsAsFactors=FALSE)
mydf1<-tbl_df(mydf)
cleaned<- mutate(mydf1,fdate=dmy_hms(paste(Date,Time,sep=" ")), Global_active_power=as.numeric(Global_active_power),Sub_metering_1=as.numeric(Sub_metering_1),Sub_metering_1=as.numeric(Sub_metering_1),Sub_metering_1=as.numeric(Sub_metering_1),Voltage=as.numeric(Voltage),Global_reactive_power=as.numeric(Global_reactive_power))%>%
filter(fdate>=ymd("2007-02-01"),fdate<ymd("2007-02-03"))
png(filename="plot4.png")
par(mfrow=c(2,2),mar = c(4, 5, 2, 1), oma = c(0, 0, 2, 0))
with(cleaned,{
	plot(fdate,Global_active_power,type="n",ylab="Global Active Power",xlab="")
	lines(fdate,Global_active_power,col="black")
	plot(fdate,Voltage, type="n",xlab="datetime")
	lines(fdate,Voltage,col="black")
	plot(fdate,Sub_metering_1,ylab="Energy sub metering",type="n",xlab="")
	lines(fdate,Sub_metering_1,col="black")
	lines(fdate,Sub_metering_2,col="red")
	lines(fdate,Sub_metering_3,col="blue")
	legend("topright", lty=1,col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
	plot(fdate,Global_reactive_power,type="n",xlab="datetime")
	lines(fdate,Global_reactive_power,col="black")
}
)
dev.off()
