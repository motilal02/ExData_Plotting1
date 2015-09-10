## Course               : Exploratory Data Analysis
## Project              : Week1 Course Project
## Main Data Source     : exdata_data_household_power_consumption.zip
## Data source for plot : power_consumption.txt
## Output Plot          : plot1.png


## Set working directory 
setwd('C:\\temp1\\Coursera\\Exploratory Data Analysis\\Week1\\Project1') 


## Load data 
power.consumption<-read.table('power_consumption.txt',header=TRUE,sep='|') 
power.consumption$DateTime<-as.POSIXlt(power.consumption$DateTime) 


## Open device 
png(filename='plot1.png',width=480,height=480,units='px') 


## Plot the data  
hist(power.consumption$GlobalActivePower,main='Global Active Power',xlab='Global Active Power (kilowatts)',col='red') 


## Turn off device 
x<-dev.off() 
