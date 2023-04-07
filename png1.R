
library(rio)
library(tidyverse)

d <- import("household_power_consumption.txt") %>% 
    mutate(Date = as.Date(Date, "%d/%m/%Y")) %>%
    filter(Date >= '2007-02-01') %>% filter(Date <= '2007-02-02') %>% mutate(Weekday = weekdays(Date),
                                                                             DateTime = paste(Date, Time),
                                                                             DateTime = as.POSIXct(DateTime))

hist(as.numeric(d$Global_active_power), main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red", cex.sub=0.7)
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
