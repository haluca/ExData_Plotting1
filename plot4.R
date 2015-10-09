## download and unzip dataset 
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","hpc.zip")
  unzip("hpc.zip")

## read data into table and subset data of wanted dates  
  dattab<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?")
  dattabsub<-subset(dattab, Date == "1/2/2007" | Date == "2/2/2007", select = Date:Sub_metering_3)

## construct measuremoment (time) from Date and Time 
  mtime<-strptime(paste(dattabsub$Date,dattabsub$Time),format="%d/%m/%Y %H:%M:%S")

## build plot4 directly for png device 
  png(filename="plot4.png")
  par(mfcol = c(2,2))

## plot1  
  plot(mtime,dattabsub$Global_active_power,type='l',xlab="",ylab="Global Active Powerrm(mtime)")
  
## plot2  
  with (dattabsub, plot(mtime,dattabsub$Sub_metering_1,type='l',xlab="",ylab="Energy sub metering"))
  with(dattabsub, points(mtime,dattabsub$Sub_metering_2,type='l',col="Red"))
  with(dattabsub, points(mtime,dattabsub$Sub_metering_3,type='l',col="Blue"))
  legend("topright",pch="_", col=c("black","red","blue"), legend = c("sub_metering_1","sub_metering_2", "sub_metering_3"),cex=.5)

## plot3
  plot(mtime,dattabsub$Voltage,type='l',xlab="datetime",ylab="Voltage")
    
## plot4
  plot(mtime,dattabsub$Global_reactive_power,type='l',xlab="datetime",ylab="Global_Reactive_Power")
  
  dev.off()
