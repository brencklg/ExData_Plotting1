#Set the working directory correctly
setwd("~/Desktop/RProjects/Coursera/ExploratoryDataAnalysis/Week1/ExData_Plotting1")
list.files()

# first load in the data from p2.rda
p2 <- read.csv(file='p2.csv')
with(p2, plot(as.POSIXct(p2$DateTime), p2$Global_active_power, type="n",
              xlab='', ylab='Energy sub metering', ylim=c(0,40)) )
lines( as.POSIXct(p2$DateTime), p2$Sub_metering_1, col='black')
lines( as.POSIXct(p2$DateTime), p2$Sub_metering_2, col='red')
lines( as.POSIXct(p2$DateTime), p2$Sub_metering_3, col='blue')
legend('topright', col=c('black', 'red', 'blue'), lty=1,
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3') )

dev.copy ( png, 'plot3.png')
dev.off()
