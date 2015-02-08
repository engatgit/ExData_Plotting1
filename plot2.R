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

#plot2
par(mfrow = c(1, 1), cex=0.75)
plot(Jandata$DT,Jandata$Global_active_power, type = "l",
     xlab="", 
     ylab="Global Active Power (kilowatts)" )
dev.copy(png, file = "plot2.png",
         width = 480, height = 480, units = "px", pointsize = 12,
         bg = "white" )
dev.off() 
