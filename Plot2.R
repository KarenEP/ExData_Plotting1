#Reading the completed dataset
epc<-read.table(file="../Resources/household_power_consumption.txt", header=TRUE,sep=";",na="?")

#Set English language 
Sys.setlocale("LC_TIME", "us") 

# Subsetting data to use
epctwodays<-epc[epc$Date %in% c("1/2/2007","2/2/2007") ,]

# Set the format of the graph
png(filename="Plot2.png",width = 480,height = 480)

# Plot the graph 
epcDate <- strptime(paste(epctwodays$Date, epctwodays$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
epcGlobalActivePower<-  as.numeric(epctwodays$Global_active_power)
plot(epcDate,epcGlobalActivePower,type="l", xlab="", ylab="Global Active Power (kilowatts)")# Plot a line graph

dev.off()



