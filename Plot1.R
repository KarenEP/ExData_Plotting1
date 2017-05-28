#Reading the completed dataset
epc<-read.table(file="../Resources/household_power_consumption.txt", header=TRUE,sep=";",na="?")

# Subsetting data to use
epctwodays<-epc[epc$Date %in% c("1/2/2007","2/2/2007") ,]

# Set the format of the graph
png(filename="Plot1.png",width = 480,height = 480)

# Plot the graph 
hist(epctwodays$Global_active_power, main="Global Active Power",col="red",xlab="Global Active Power(kilowatts)")# Plot a histogram graph

dev.off()

