plot2<-function(){
  #read file
  fileName <- "household_power_consumption.txt"
  dataSet <- read.table(fileName, header=TRUE, sep=";", stringsAsFactors=FALSE)
  
  #select two days
  TwoDays <- filter(dataSet,dataSet$Date == "1/2/2007" | dataSet$Date == "2/2/2007") 
  
  #Combine Date and Time
  TimeAndDate <- strptime(paste(TwoDays$Date, TwoDays$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
    
  #Global Active Power as number 
  Gap <- as.numeric(TwoDays$Global_active_power)
  
  #Plot to .png
  png("plot2.png", width=480, height=480)
  plot(TimeAndDate, Gap, type="l", xlab=" ", ylab="Global Active Power (kilowatts)")
  dev.off()
  
}