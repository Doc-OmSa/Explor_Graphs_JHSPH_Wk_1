## Read data

data<-read.table("E:/JOHN HOPKIN'S SPECIALIZATION IN DATA SCIENCE COURSE/DATASETS for practice/EXPLORATORY DATA ANALYSIS/household_power_consumption.txt",sep=";",header=TRUE)

## Manage dat and time as advised in the assignment
data$Date<-as.Date(data$Date, format="%d/%m/%Y")

data<-data[data$Date=="2007-02-02"|data$Date=="2007-02-01",]

data$Time<-paste(data$Date,data$Time,sep=" ")

data$Time<-strptime(data$Time, format="%Y-%m-%d %H:%M:%S")

### assign numeric data types to variables
data$Global_active_power<-as.numeric(data$Global_active_power)
data$Global_reactive_power <-as.numeric(data$Global_reactive_power)

### set parameters for plots combined
par(mfrow=c(2,2),mar=c(4,4,4,4),oma=c(2,2,0,0))


## write plot function
with(data,{
  
  plot(Time,data$Global_active_power,ylab="Global Active Power (kilowatts)",
       xlab=" ",type="l", col = "green")
  
  plot(Time,Voltage,xlab="datetime",type="l", col = "violet")
  
  plot(Time,Sub_metering_1,type="l",ylab="Energy sub metering",xlab=" ",
       col="black")
  lines(Time,Sub_metering_2,type="l",col="red")
  lines(Time,Sub_metering_3,type="l",col="blue")
  legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
         col=c("black","red","blue"), lty=1)
  
  plot(Time,Global_reactive_power,xlab="datetime",type="l", col = "purple")
})

dev.copy(png,'plot4.png')

dev.off()
