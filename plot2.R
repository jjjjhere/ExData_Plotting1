# Read and extract data
dat <- read.csv("household_power_consumption.txt",sep=";")
dat$Date <- as.Date(dat$Date,"%d/%m/%Y")
dat <- dat[(dat$Date == "2007-02-01")|(dat$Date == "2007-02-02"),]

# Exract the variable for plotting
tm <- strptime(paste(dat$Date,dat$Time),"%Y-%m-%d %H:%M:%S")
gap <- as.numeric(levels(dat$Global_active_power))[dat$Global_active_power]

# Plot
png("plot2.png",width = 480, height = 480)
plot(tm, gap, type ="l",xlab ="",ylab = "Global Active Power (kilowatts)")
dev.off()
