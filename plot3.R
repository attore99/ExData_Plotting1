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
png("plot3.png")
plot3<-plot((dataset$newdate),as.numeric(dataset$Sub_metering_1), type="l",ylab="Energy sub metering",xlab="")
lines((dataset$newdate),as.numeric(dataset$Sub_metering_2), type="l",col="red")
lines((dataset$newdate),as.numeric(dataset$Sub_metering_3), type="l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()



#check if there are "?"s in my selected dataset. No "?"s left
# somma<-0
#   for (i in 3:ncol(dataset)){
#     for (j in 3:nrow(dataset)){
#       if (dataset[j,i]==c)
#       {
#         somma<-somma+1
#       }
#     }
#   }
# somma
