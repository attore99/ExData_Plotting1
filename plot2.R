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
png('plot2.png')
plot2<-plot((dataset$newdate),as.numeric(dataset$Global_active_power), type="l",ylab="Global Active Power (kilowatts)",xlab="")
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

