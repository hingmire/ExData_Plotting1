##1. Loading data

## Download Data

## download data and unzip it
download.file(
"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
"Electric power consumption.zip")

## 2. Unzip Data
unzip("Electric power consumption.zip")

	
## 3. Load Data in dataframe

## read few lines to know classes of all cols
tab5rows <- read.table("household_power_consumption.txt", header = TRUE,stringsAsFactors=F,sep = ";", nrows = 5)
classes <- sapply(tab5rows, class)

## Read complete Data in a data frame
electric_consumption <- read.table("household_power_consumption.txt",na.strings=c("?"),header = TRUE,sep = ";",colClasses = classes)

## plot histogram

## convert date
electric_consumption$Date <- strptime(electric_consumption$Date,"%d/%m/%Y")

## subset data for two days
twodaydata <- subset(electric_consumption, Date == "2007-02-01" | Date == "2007-02-02") 

## plot and save file

png(file="plot_1.png",width=400,height=400)
hist(twodaydata$Global_active_power, 
     main="Global Active Power", 
     xlab="Global Active Power(kilowatts)", 
     xlim=c(0,6),
	 ylim=c(0,1200),
	 col ="red",
    breaks=12)
## close device file
dev.off()

 
