plot3<-function(){
  #read file
  fileName <- "household_power_consumption.txt"
  dataSet <- read.table(fileName, header=TRUE, sep=";", stringsAsFactors=FALSE)
  
  #select two days
  TwoDays <- filter(dataSet,dataSet$Date == "1/2/2007" | dataSet$Date == "2/2/2007") 
  
  #Combine Date and Time
  TimeAndDate <- strptime(paste(TwoDays$Date, TwoDays$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
    
  png("plot3.png", width=480, height=480)
  plot(TimeAndDate, as.numeric(TwoDays$Sub_metering_1), type="l", ylab="Energy Submetering", xlab="")
  lines(TimeAndDate, as.numeric(TwoDays$Sub_metering_2), type="l", col="red")
  lines(TimeAndDate, as.numeric(TwoDays$Sub_metering_3), type="l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"))
  dev.off()
}