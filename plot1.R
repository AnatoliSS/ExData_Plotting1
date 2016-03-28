plot1<-function(){
  #read file
  fileName <- "household_power_consumption.txt"
  dataSet <- read.table(fileName, header=TRUE, sep=";", stringsAsFactors=FALSE)

  #select two days
  TwoDays <- filter(dataSet,dataSet$Date == "1/2/2007" | dataSet$Date == "2/2/2007") 
  
  #Global Active Power as number 
  Gap <- as.numeric(TwoDays$Global_active_power)
  
  #Plot to .png
  png("plot1.png", width=480, height=480)
  hist(globalActivePower, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")
  dev.off()
}