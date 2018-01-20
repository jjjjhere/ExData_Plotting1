# Read and extract data
dat <- read.csv("household_power_consumption.txt",sep=";")
dat$Date <- as.Date(dat$Date,"%d/%m/%Y")
dat <- dat[(dat$Date == "2007-02-01")|(dat$Date == "2007-02-02"),]

# Exract the variable for plotting
gap <- as.numeric(levels(dat$Global_active_power))[dat$Global_active_power]

# histogram
png("plot1.png",width = 480, height = 480)
hist(gap, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()
