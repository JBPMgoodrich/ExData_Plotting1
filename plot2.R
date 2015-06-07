###
###
#     plot2.R
#     - Output: file plot2.png
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
#     Plot 2 description
#     - scatterplot with dots connected -- actually a LINE PLOT
#     - title is BLANK
#     - x axis is UNlabeled
#     - y axis is labeled "Global Active Power (kilowatts)"
#
#     Use png() to direct to file
#     And complete with dev.off()


###
#     First convert variables for date and time to Date/Time class using strptime()

subdata$datetime<- strptime( paste(subdata$Date1 ,subdata$Time) ,format="%Y-%m-%d %H:%M:%S" )


png("plot2.png")
plot(  subdata$datetime ,subdata$Global_active_power
      ,ylab="Global Active Power (kilowatts)"  ,main="" ,xlab= ""
      ,type="l"
      )
dev.off()