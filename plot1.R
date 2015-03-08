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

#plot1
#png(file = "plot1.png",width = 480, height = 480, units = "px") )
par(mfrow = c(1, 1), cex=.751)
hist(Jandata$Global_active_power,  col="red",
     xlab="Global Active Power (kilowatts)", 
     ylab="Frequency" ,
     main="Global Active Power")
dev.copy(png, file = "plot1.png",
         width = 480, height = 480, units = "px", pointsize = 12,
         bg = "white" )
dev.off() 
