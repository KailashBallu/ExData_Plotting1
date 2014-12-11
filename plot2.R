library(dplyr)
library(lubridate)
library(grDevices)
# the code to download and unzip file commented out 
#URL = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#download.file(URL, destfile = "exdata_date_household_power_consumption.zip", method="curl")
#unzip("exdata_date_household_power_consumption.zip")
mydf<-read.table(file="household_power_consumption.txt",sep=";",header=TRUE,,stringsAsFactors=FALSE)
mydf1<-tbl_df(mydf)
cleaned<- mutate(mydf1,fdate=dmy_hms(paste(Date,Time,sep=" ")),dt=wday(fdate), Global_active_power=as.numeric(Global_active_power))%>%
filter(fdate>=ymd("2007-02-01"),fdate<ymd("2007-02-03"))
png(filename="plot2.png")
with(cleaned,plot(fdate,Global_active_power,ylab="Global Active Power (kilowatts)",type="n"))
lines(cleaned$fdate,cleaned$Global_active_power)
dev.off()