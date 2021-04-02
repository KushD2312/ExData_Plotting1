library("data.table")

setwd("C:/Users/Kush Dhanwatay/Desktop/EDA_PGA")


PowerPlot1 <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")

PowerPlot1[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

PowerPlot1[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

PowerPlot1 <- PowerPlot1[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

png("plot1.png", width=480, height=480)

hist(PowerPlot1[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()