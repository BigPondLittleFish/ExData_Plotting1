
library(rio)
library(tidyverse)

d <- import("household_power_consumption.txt") %>% 
    mutate(Date = as.Date(Date, "%d/%m/%Y")) %>%
    filter(Date >= '2007-02-01') %>% filter(Date <= '2007-02-02') %>% mutate(Weekday = weekdays(Date),
                                                                             DateTime = paste(Date, Time),
                                                                             DateTime = as.POSIXct(DateTime))


plot(d$Global_active_power~d$DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
