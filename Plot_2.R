##1. Loading data

## Download Data
## set working directory
filelocation <- "C:/Users/hingmire/test1" 
setwd(filelocation)

## download data and unzip it
download.file(
"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
"Electric power consumption.zip")

## 2. Unzip Data
unzip("Electric power consumption.zip")

##3.## set working directory
##setwd(paste(filelocation, "/Electric power consumption", sep = ""))
	
## 3. Load Data in dataframe

## read few lines to know classes of all cols
tab5rows <- read.table("household_power_consumption.txt", header = TRUE,stringsAsFactors=F,sep = ";", nrows = 5)
classes <- sapply(tab5rows, class)

## Read complete Data in a data frame
electric_consumption <- read.table("household_power_consumption.txt",na.strings=c("?"),header = TRUE,sep = ";",colClasses = classes)

## combine data and time values
Datetime <- paste(electric_consumption$Date,electric_consumption$Time) 
## add datetime value to another dataframe
electric_consumption_2 <- data.frame(electric_consumption,Datetime)
## format datetime value
electric_consumption_2$Datetime <- strptime(electric_consumption_2$Datetime,"%d/%m/%Y %H:%M:%S")

## format date value
electric_consumption_2$Date <- strptime(electric_consumption$Date,"%d/%m/%Y")

## plot histogram

## subset data for two days
twodaydata <- subset(electric_consumption_2, Date == "2007-02-01" | Date == "2007-02-02") 

## plot and save file
png(file="plot_2.png",width=400,height=400)
with(twodaydata,plot(Datetime,Global_active_power,ylab="Global Active Power(kilowatts)",type="n"))
with(twodaydata,lines(Datetime,Global_active_power))
## close device file
dev.off()

 
