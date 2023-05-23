## Read data

data<-read.table("E:/JOHN HOPKIN'S SPECIALIZATION IN DATA SCIENCE COURSE/DATASETS for practice/EXPLORATORY DATA ANALYSIS/household_power_consumption.txt",sep=";",header=TRUE)

## Manage dat and time as advised in the assignment
data$Date<-as.Date(data$Date, format="%d/%m/%Y")

## make subset of the two days
data<-data[data$Date=="2007-02-02"|data$Date=="2007-02-01",]

## handle time variable 
data$Time<-paste(data$Date,data$Time,sep=" ")

data$Time<-strptime(data$Time, format="%Y-%m-%d %H:%M:%S")

## assign numeric character to sub metering variable 1,2,3
data$Sub_metering_1<-as.numeric(data$Sub_metering_1)

data$Sub_metering_2<-as.numeric(data$Sub_metering_2)

data$Sub_metering_3<-as.numeric(data$Sub_metering_3)

### make plot between time and sub metering variable
plot(data$Time,data$Sub_metering_1,type="l",ylab="Energy sub metering",xlab=" ",col="black")

lines(data$Time,data$Sub_metering_2,type="l",col="red")

lines(data$Time,data$Sub_metering_3,type="l",col="blue")

### give legend

legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1)

## save as png in wd
dev.copy(png,'plot3.png')

dev.off()