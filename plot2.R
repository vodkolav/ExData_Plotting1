debugSource('readData.R')
par(mfrow = c(1,1))
#Sys.setlocale(category = "LC_ALL", locale = "english")
# Attention: It seems like one can't change locale on plots without 
# changing it on the system, which I am not going to do.
# Hence, the days labels on all my plots are in hebrew. 
#https://en.wikipedia.org/wiki/Hebrew_calendar#Names_of_weekdays
consumption <- readData()
with(consumption, plot(Global_active_power ~ Date ,  type = 'l',xlab = 'Day', ylab = 'Global Active Power (kilowatts)'))
dev.copy(png,'plot2.png')
dev.off()