## download and unzip dataset 
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","hpc.zip")
unzip("hpc.zip")

## read data into table and subset data of wanted dates  
dattab<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?")
dattabsub<-subset(dattab, Date == "1/2/2007" | Date == "2/2/2007", select = Date:Sub_metering_3)

## build plot1
hist(dattabsub$Global_active_power,col=2, main="Global Active Power",xlab="Global Active Power(kilowatts)")

## make png-file
dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()
