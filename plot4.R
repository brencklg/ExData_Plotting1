#Set the working directory correctly
setwd("~/Desktop/RProjects/Coursera/ExploratoryDataAnalysis/Week1/ExData_Plotting1")
list.files()

# first load in the data from p2.rda
p2 <- read.csv(file='p2.csv')

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(p2, plot(as.POSIXct(p2$DateTime), p2$Global_active_power, type="l",
              xlab='', ylab='Global Active Power (kilowatts)') )

with(p2, plot(as.POSIXct(p2$DateTime), p2$Voltage, type="l",
              xlab='datetime', ylab='Voltage') )

with(p2, plot(as.POSIXct(p2$DateTime), p2$Global_active_power, type="n",
              xlab='', ylab='Energy sub metering', ylim=c(0,40)) )
lines( as.POSIXct(p2$DateTime), p2$Sub_metering_1, col='black')
lines( as.POSIXct(p2$DateTime), p2$Sub_metering_2, col='red')
lines( as.POSIXct(p2$DateTime), p2$Sub_metering_3, col='blue')
legend('topright', col=c('black', 'red', 'blue'), lty=1,
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3') )

with(p2, plot(as.POSIXct(p2$DateTime), p2$Global_reactive_power, type="l",
              xlab='datetime', ylab='Global Reactive Power') )

dev.copy ( png, 'plot4.png')
dev.off()
