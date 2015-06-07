###
###
#     plot4.R
#     - Output: file plot4.png
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
#     Plot 4 (multiple plots) description
#     - Upper left plot is same as in plot2.R
#     - Lower left plot is same as in plot3.R
#
#     Use png() to direct to file
#     And complete with dev.off()


###
#     First convert variables for date and time to Date/Time class using strptime()

subdata$datetime<- strptime( paste(subdata$Date1 ,subdata$Time) ,format="%Y-%m-%d %H:%M:%S" )


png("plot4.png")
#     Set for multiple plots, filling columns first
par( mfcol=c(2,2) )

#     same as plot2.R, with shortened title
plot(  subdata$datetime ,subdata$Global_active_power
       ,ylab="Global Active Power"  ,main="" ,xlab= ""
       ,type="l"
)

#     Same as plot3.R, with no outline on legend
plot(  subdata$datetime ,subdata$Sub_metering_1
      ,ylab="Energy sub metering"  ,main="" ,xlab= ""
      ,type="l" ,col="black"
      )
points(subdata$datetime ,subdata$Sub_metering_2 ,type="l" ,col="red")
points(subdata$datetime ,subdata$Sub_metering_3 ,type="l" ,col="blue")
legend( "topright" 
        ,legend= c("Sub_metering_1" ,"Sub_metering_2" ,"Sub_metering_3") 
        ,lwd=1 ,col=c("black" ,"red" ,"blue")
        ,bty="n"
        )

#     Added line plot of Voltage (y) by datetime (x)
with( subdata,
      plot(  datetime ,Voltage
             ,main=""
            ,type="l"
            )
      )

#     Added line plot of Global_reactive_power(y) by datetime (x)
with( subdata,
      plot(  datetime ,Global_reactive_power
             ,main=""
             ,type="l"
      )
)
dev.off()