library("data.table")

setwd("C:/Users/Kush Dhanwatay/Desktop/EDA_PGA")

PowerPlot3 <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")

PowerPlot3[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

PowerPlot3[,Time_date := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

PowerPlot3 <- PowerPlot3[(Time_date >= "2007-02-01") & (Time_date < "2007-02-03")]

png("plot3.png", width=480, height=480)

plot(PowerPlot3[, Time_date], PowerPlot3[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(PowerPlot3[, Time_date], PowerPlot3[, Sub_metering_2],col="red")
lines(PowerPlot3[, Time_date], PowerPlot3[, Sub_metering_3],col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

dev.off()