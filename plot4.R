##read the data - assumes data is in your working directory
zipFile <- "exdata-data-household_power_consumption.zip"
dataFile <- "household_power_consumption.txt"
formats <- (c( 'character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric' ))
data <-read.table(unz(zipFile, dataFile), header=TRUE, quote="\"", sep=";"
                  , na.strings ='?', colClasses = formats)
#subset of data
Jandata <- data[data$Date =='1/2/2007' | data$Date =='2/2/2007', ]
#date time conversion
Jandata$DT <- strptime(paste(Jandata$Date, Jandata$Time), '%d/%m/%Y %H:%M:%S')  

#plot4
png(  file = "plot4.png", width = 480, height = 480, units = "px", pointsize = 12,
      bg = "white" )
par(mfrow = c(2, 2), cex=.75)
  plot(Jandata$DT, Jandata$Global_active_power, type = "l",
                   xlab="", 
                   ylab="Global Active Power")
  plot(Jandata$DT, Jandata$Voltage, type = "l",
          xlab="datetime", 
          ylab="Voltage")
  plot(Jandata$DT, Jandata$Sub_metering_1, type = "l",
                         xlab="", 
                         ylab="Energy sub metering") 
    lines(Jandata$DT, Jandata$Sub_metering_2,  col= 'red') 
    lines(Jandata$DT, Jandata$Sub_metering_3,  col= 'blue')
    legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
                      lty =1,
                       col= c("black" , "red" ,"blue"),
                      bty = "n")
 plot(Jandata$DT, Jandata$Global_reactive_power, type = "l",
            xlab="datetime", 
            ylab="Global_reactive_power")
dev.off() 
