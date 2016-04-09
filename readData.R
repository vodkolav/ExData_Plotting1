readData <- function ()
{
  #if (!exists('consumption') | is.null(consumption))
 # {
    library(lubridate)
    start <- dmy_hms('16/12/2006 17:24:00')
    goal <- ymd_hms( c('2007-02-01 00:00:00',  '2007-02-02 23:59:59'))
    
    skip<- as.numeric(difftime(goal[1],start, units = 'mins') )
    toread<- round(as.numeric(difftime(goal[2],goal[1], units = 'mins') ))
    headers <- read.table('household_power_consumption.txt', header = FALSE, na.strings = '?', nrows = 1, sep = ';')
    consumption<- read.table('household_power_consumption.txt', header = FALSE, na.strings = '?', skip = skip, nrows = toread, sep = ';',stringsAsFactors = FALSE )
    colnames(consumption) <- unlist(headers)
    consumption$Date <- apply( consumption[ , c('Date', 'Time') ] , 1 , paste , collapse = "-" )
    consumption$Date<- dmy_hms(consumption$Date)
    return(consumption)
 # }
}