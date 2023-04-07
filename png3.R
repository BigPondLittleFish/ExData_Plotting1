
library(rio)
library(tidyverse)

d <- import("household_power_consumption.txt") %>% 
    mutate(Date = as.Date(Date, "%d/%m/%Y")) %>%
    filter(Date >= '2007-02-01') %>% filter(Date <= '2007-02-02') %>% mutate(Weekday = weekdays(Date),
                                                                             DateTime = paste(Date, Time),
                                                                             DateTime = as.POSIXct(DateTime))

with(d, {
    plot(Sub_metering_1~DateTime, type="l",ylab="Global Active Power (kilowatts)", xlab="", cex=0.8)
    lines(Sub_metering_2~DateTime, col='Red')
    lines(Sub_metering_3~DateTime, col='Blue')})

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.8)
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
