###
###
#     plot1.R
#     - Output: file plot1.png
#     - Assumption: Starting from R home directoy, so navigate to assignment 1 working directory
#     - Input raw data

setwd("C:/Documents and Settings/Parents/My Documents/My R/exdata_data_household_power_consumption/ExData_Plotting1")
infile = "household_power_consumption.txt"
data<- read.table(infile ,header=TRUE ,sep=";" ,na.strings="?")      ## ,nrows=10


###
#     Use data from dates 2007-02-01 and 2007-02-02
#     But first need to convert from column Date from typeof factor to typeof date
#     - factors are in dd/mm/yyyy format

data$Date1<- as.Date(data$Date ,"%d/%m/%Y")
subdata<- subset(data ,data$Date1 == "2007-02-01" | data$Date1 == "2007-02-02")


###
#     Plot 1 description
#     - histogram of red bars
#     - title is "Global Active Power"
#     - x axis is labeled "Global Active Power (kilowatts)"
#     - y axis is labeled "Frequency"
#
#     Use png() to direct to file
#     And complete with dev.off()

png("plot1.png")
hist( subdata$Global_active_power 
      ,col="red" 
      ,main="Global Active Power" ,xlab="Global Active Power (kilowatts)" ,ylab= "Frequency"
      )
dev.off()