## Course               : Exploratory Data Analysis
## Project              : Week1 Course Project
## Main Data Source     : exdata_data_household_power_consumption.zip
## Data source for plot : power_consumption.txt
## Output Plot          : plot3.png


## Set working directory 
setwd('C:\\temp1\\Coursera\\Exploratory Data Analysis\\Week1\\Project1') 


## Load data 
power.consumption<-read.table('power_consumption.txt',header=TRUE,sep='|') 
power.consumption$DateTime<-as.POSIXlt(power.consumption$DateTime) 

## Open device 
png(filename='plot3.png',width=480,height=480,units='px') 


## Plot the data 
lncol<-c('black','red','blue') 
lbls<-c('Sub_metering_1','Sub_metering_2','Sub_metering_3') 
plot(power.consumption$DateTime,power.consumption$Sub_Metering_1,type='l',col=lncol[1],xlab='',ylab='Energy sub metering') 
lines(power.consumption$DateTime,power.consumption$Sub_Metering_2,col=lncol[2]) 
lines(power.consumption$DateTime,power.consumption$Sub_Metering_3,col=lncol[3]) 


## Add legends
legend('topright',legend=lbls,col=lncol,lty='solid') 


## Close device 
x<-dev.off() 