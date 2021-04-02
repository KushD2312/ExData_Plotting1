library("data.table")

setwd("C:/Users/Kush Dhanwatay/Desktop/EDA_PGA")

PowerPlot2 <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")

PowerPlot2[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

PowerPlot2[, Time_date := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

PowerPlot2<-PowerPlot2[(Time_date >= "2007-02-01") & (Time_date < "2007-02-03")]

png("plot2.png", width=480, height=480)

plot(x = PowerPlot2[, Time_date]
     , y = PowerPlot2[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()