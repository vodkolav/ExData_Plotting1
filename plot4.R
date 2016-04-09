debugSource('readData.R')
#Sys.setlocale(category = "LC_ALL", locale = "english")
consumption <- readData()
par(mfrow = c(2,2))

#same as Plot2
with(consumption, plot(Global_active_power ~ Date ,  type = 'l',xlab = 'Day', ylab = 'Global Active Power (kilowatts)'))

#Voltage plot
with(consumption, plot(Voltage ~ Date ,  type = 'l',xlab = 'Day', ylab = 'Voltage'))

#Same as Plot3
with(consumption, plot(Date, Sub_metering_1, type = 'l',xlab = 'Day',col = 'black', ylab = 'Energy Sub metering'))
with(consumption, lines(Date, Sub_metering_2, type = 'l',xlab = 'Day', col = 'red'))
with(consumption, lines(Date, Sub_metering_3, type = 'l',xlab = 'Day', col = 'blue'))
legend('topright', c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'), lty = c(1,1,1))

#Global_reactive_power plot
with(consumption, plot(Global_reactive_power ~ Date ,  type = 'l',xlab = 'Day'))

dev.copy(png,'plot4.png')
dev.off()