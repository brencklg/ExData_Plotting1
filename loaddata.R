#Make sure the necessary libraries are loaded
library(dplyr)
library(tidyr)

#Set the working directory correctly
setwd("~/Desktop/RProjects/Coursera/ExploratoryDataAnalysis/Week1/ExData_Plotting1")
list.files()
readtime <- Sys.time()
readtime

# Read in the dataset - a text file called household_power_consumption.txt
# Note: NA character is "?", there are variable names in a header
power <- read.csv(file="./data/household_power_consumption.txt", sep=';', header=TRUE, na.strings = '?',
   colClasses = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric' ) )

# convert variables Date and Time into the proper format, make that be the first column
# combine the data and time strinfs and convert to POSIXct format
# make DataTime be the first column and drop the separate Date and Time columns
power <- tbl_df(power)
power <-mutate ( power, 
        DateTime = as.POSIXct(strptime(paste( power$Date, power$Time, sep=" "), '%d/%m/%Y%H:%M:%S')) )
power <- select(power, 10, 3:9)

#Filter the 2M observqtions down to the ones of interest
startdate <- as.POSIXct('2007-02-01')
enddate <- as.POSIXct('2007-02-03')
p2 <- filter(power, DateTime >= startdate & DateTime <= enddate)

# save the data for future manipulation
save(power, file = "power.rda")
save (p2, file = "p2.rda")
write.table(power, file="power.csv",append=FALSE,quote=TRUE,sep=",", 
            eol="\n",na="NA",dec=".",row.names=FALSE, col.names=TRUE,
            qmethod=c("escape","double"), fileEncoding="")
write.table(p2, file="p2.csv",append=FALSE,quote=TRUE,sep=",", 
            eol="\n",na="NA",dec=".",row.names=FALSE, col.names=TRUE,
            qmethod=c("escape","double"), fileEncoding="")

