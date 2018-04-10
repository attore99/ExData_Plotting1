#read and import the data
dataset<-read.table("household_power_consumption.txt",sep=";",header = T, stringsAsFactors=FALSE, dec=".")

#convert the date
dataset$Date<-as.Date(dataset$Date,"%d/%m/%Y")

#create date-time column
dataset$newdate <- with(dataset, as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%OS"))

#filter the data
dataset<-subset(dataset,dataset$Date>=as.Date("2007-02-01")&dataset$Date<=as.Date("2007-02-02"))

#Get days in English
Sys.setlocale("LC_TIME", "English")

#open the device and save the plot
png('plot4.png')

#multiple plots in one page
par(mfrow=c(2,2))
plot1<-plot((dataset$newdate),as.numeric(dataset$Global_active_power), type="l",ylab="Global Active Power",xlab="")
plot2<-plot((dataset$newdate),as.numeric(dataset$Voltage), type="l",ylab="Voltage",xlab="datetime")
plot3<-plot((dataset$newdate),as.numeric(dataset$Sub_metering_1), type="l",ylab="Energy sub metering",xlab="")
lines((dataset$newdate),as.numeric(dataset$Sub_metering_2), type="l",col="red")
lines((dataset$newdate),as.numeric(dataset$Sub_metering_3), type="l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
plot4<-plot((dataset$newdate),as.numeric(dataset$Global_reactive_power), type="l",ylab="Global_reactive_power",xlab="datetime")
dev.off()
