## Read data

data<-read.table("E:/JOHN HOPKIN'S SPECIALIZATION IN DATA SCIENCE COURSE/DATASETS for practice/EXPLORATORY DATA ANALYSIS/household_power_consumption.txt",sep=";",header=TRUE)

## Manage dat and time as advised in the assignment
data$Date<-as.Date(data$Date, format="%d/%m/%Y")

data<-data[data$Date=="2007-02-02"|data$Date=="2007-02-01",]

data$Time<-paste(data$Date,data$Time,sep=" ")

data$Time<-strptime(data$Time, format="%Y-%m-%d %H:%M:%S")

### assign numeric data type to Global Active Power 
data$Global_active_power<-as.numeric(data$Global_active_power)

### make a line plot

plot(data$Time, data$Global_active_power,  xlab = "Global Active Power",
     ylab = "Time", width = 480, height = 480, col = "magenta", type = "l")

## save as png
dev.copy(png,'plot2.png')
dev.off()