#Set the working directory correctly
setwd("~/Desktop/RProjects/Coursera/ExploratoryDataAnalysis/Week1/ExData_Plotting1")
list.files()

# first load in the data from p2.rda
p2 <- read.csv(file='p2.csv')

# plot the histogram as a png file

with ( p2, hist(Global_active_power, xlab='Global Active Power (kilowatts)',
                ylab='Frequency', main='Global Active Power', col='red'))
dev.copy ( png, 'plot1.png')
dev.off()



