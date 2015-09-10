## Course       : Exploratory Data Analysis
## Project      : Week1 Course Project
## Data Source  : exdata_data_household_power_consumption.zip

## Setting working directory 
setwd('C:\\temp1\\Coursera\\Exploratory Data Analysis\\Week1\\Project1') 


## Invoking required packages 
library(data.table) 
library(lubridate) 


## check to see if the existing Power Consumption data set exists; if not download the zip file
if (!file.exists('power_consumption.txt')) { 
        
        ## Unzip file
        unzip('exdata_data_household_power_consumption.zip',exdir='.',overwrite=TRUE) 
        
        
        ## Read the raw data 
        variable.class<-c(rep('character',2),rep('numeric',7)) 
        power.consumption<-read.table('household_power_consumption.txt',header=TRUE, 
                                      sep=';',na.strings='?',colClasses=variable.class) 
        
        
        ## Limit the data set to 2 days based on the project instruction (dates 2007-02-01 and 2007-02-02)
        power.consumption<-power.consumption[power.consumption$Date=='1/2/2007' | power.consumption$Date=='2/2/2007',] 
        
        
        ## Clean up the variable names and convert date/time fields 
        cols<-c('Date','Time','GlobalActivePower','GlobalReactivePower','Voltage','GlobalIntensity', 
                'Sub_Metering_1','Sub_Metering_2','Sub_Metering_3') 
        colnames(power.consumption)<-cols 
        power.consumption$DateTime<-dmy(power.consumption$Date)+hms(power.consumption$Time) 
        power.consumption<-power.consumption[,c(10,3:9)] 
        
        
        ## write a clean data set to the directory 
        write.table(power.consumption,file='power_consumption.txt',sep='|',row.names=FALSE) 
} else { 
        power.consumption<-read.table('power_consumption.txt',header=TRUE,sep='|') 
        power.consumption$DateTime<-as.POSIXlt(power.consumption$DateTime) 
} 


## After extracting the data needed from the large file, removing the large raw dataset file
if (file.exists('household_power_consumption.txt')) { 
        x<-file.remove('household_power_consumption.txt') 
} 
