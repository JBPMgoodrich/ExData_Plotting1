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
#     Plot 3 description
#     - Line plot
#     - title is BLANK
#     - x axis is UNlabeled
#     - y axis is labeled "Energy sub metering"
#     - legend in topright for Sub_metering_1, Sub_metering_2, and Sub_metering_3
#     - plot first line, then add points for 2nd and 3rd, but before legend
#
#     Use png() to direct to file
#     And complete with dev.off()


###
#     First convert variables for date and time to Date/Time class using strptime()

subdata$datetime<- strptime( paste(subdata$Date1 ,subdata$Time) ,format="%Y-%m-%d %H:%M:%S" )


png("plot3.png")
plot(  subdata$datetime ,subdata$Sub_metering_1
      ,ylab="Energy sub metering"  ,main="" ,xlab= ""
      ,type="l" ,col="black"
      )
points(subdata$datetime ,subdata$Sub_metering_2 ,type="l" ,col="red")
points(subdata$datetime ,subdata$Sub_metering_3 ,type="l" ,col="blue")
legend( "topright" 
        ,legend= c("Sub_metering_1" ,"Sub_metering_2" ,"Sub_metering_3") 
        ,lwd=1 ,col=c("black" ,"red" ,"blue")
        )
dev.off()