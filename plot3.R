# Read and extract data
dat <- read.csv("household_power_consumption.txt",sep=";")
dat$Date <- as.Date(dat$Date,"%d/%m/%Y")
dat <- dat[(dat$Date == "2007-02-01")|(dat$Date == "2007-02-02"),]

# Exract the variable for plotting
tm <- strptime(paste(dat$Date,dat$Time),"%Y-%m-%d %H:%M:%S")
sub1 <- as.numeric(levels(dat$Sub_metering_1))[dat$Sub_metering_1]
sub2 <- as.numeric(levels(dat$Sub_metering_2))[dat$Sub_metering_2]
sub3 <- dat$Sub_metering_3
# Plot
png("plot3.png",width = 480, height = 480)
plot(tm, sub1, type ="l",xlab ="",ylab = "Energy sub metering")
lines(tm,sub2, col = "red")
lines(tm,sub3, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"),lty=1)
dev.off()

