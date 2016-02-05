#Set the working directory correctly
setwd("~/Desktop/RProjects/Coursera/ExploratoryDataAnalysis/Week1/ExData_Plotting1")
list.files()

# first load in the data from p2.rda
p2 <- read.csv(file='p2.csv')
with(p2, plot(as.POSIXct(p2$DateTime), p2$Global_active_power, type="l",
     xlab='', ylab='Global Active Power (kilowatts)') )

dev.copy ( png, 'plot2.png')
dev.off()
