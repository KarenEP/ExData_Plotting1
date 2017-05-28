#Reading the completed dataset
epc<-read.table(file="../Resources/household_power_consumption.txt", header=TRUE,sep=";",na="?")

#Set English language 
Sys.setlocale("LC_TIME", "us") 

# Subsetting data to use
epctwodays<-epc[epc$Date %in% c("1/2/2007","2/2/2007") ,]

# Set the format of the graph
png(filename="Plot4.png",width = 480,height = 480) 



#Set space for four different graphs 
par(mfrow=c(2,2),mar=c(4,4,2,1))

# Plotting first topleft graph

epcDate <- strptime(paste(epctwodays$Date, epctwodays$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
epcGlobalActivePower<-  as.numeric(epctwodays$Global_active_power)
plot(epcDate,epcGlobalActivePower,type="l", xlab="", ylab="Global Active Power") # Plot a line graph

# Plotting toprigh graph

epcVoltage<-  as.numeric(epctwodays$Voltage)
plot(epcDate,epcVoltage,type="l", xlab="datetime",ylab="Voltage")# Plot a line graph

# Plotting bottonleft graph

epcDate <- strptime(paste(epctwodays$Date, epctwodays$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
epcSubMet1<-  as.numeric(epctwodays$Sub_metering_1)
epcSubMet2<-  as.numeric(epctwodays$Sub_metering_2)
epcSubMet3<-  as.numeric(epctwodays$Sub_metering_3)
plot(epcDate,epcSubMet1,type="l", xlab="", ylab="Energy sub metering")# Plot a line graph of the first variable
lines(epcDate,epcSubMet2,type="l",col="red") # Plot a line graph of the second variable in the same graph
lines(epcDate,epcSubMet3,type="l",col="blue") # Plot a line graph of the third variable in the same graph
legend("toprigh",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1), col=c("black","red","blue"))

# Plotting bottonright graph

epcGlobalReactivePower<-  as.numeric(epctwodays$Global_reactive_power)
plot(epcDate,epcGlobalReactivePower,type="l", xlab="datetime", ylab="Global_reactive_power") # Plot a line graph


dev.off()

