#Reading the completed dataset
epc<-read.table(file="../Resources/household_power_consumption.txt", header=TRUE,sep=";",na="?")

#Set English language 
Sys.setlocale("LC_TIME", "us") 

# Subsetting data to use
epctwodays<-epc[epc$Date %in% c("1/2/2007","2/2/2007") ,]

# Set the format of the graph
png(filename="Plot3.png",width = 480,height = 480)


epcDate <- strptime(paste(epctwodays$Date, epctwodays$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
epcSubMet1<-  as.numeric(epctwodays$Sub_metering_1)
epcSubMet2<-  as.numeric(epctwodays$Sub_metering_2)
epcSubMet3<-  as.numeric(epctwodays$Sub_metering_3)


plot(epcDate,epcSubMet1,type="l", xlab="", ylab="Energy sub metering")
lines(epcDate,epcSubMet2,type="l",col="red")
lines(epcDate,epcSubMet3,type="l",col="blue")
legend("toprigh",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1), col=c("black","red","blue"))


dev.off()
