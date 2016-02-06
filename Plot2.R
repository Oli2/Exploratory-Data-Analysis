#first add the part which will download and unzip the file in the working
# directory


library(dplyr)
library(lubridate)

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

#creating the temp file which will be used to download and unzip the url

temp <- tempfile()
download.file(url, temp)

file <- unzip(temp)

unlink(temp)


df <-read.csv("./household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)

df1<- tbl_df(df)

df1$Date<- paste(df1$Date, df$Time, sep = ' ')

df1<- select(df1, -Time)

df1$Date <- dmy_hms(df1$Date)

df2 <- filter(df1, Date >= "2007-02-01" & Date < "2007-02-03")

df2$Global_active_power <- as.numeric(df2$Global_active_power)

df2$Sub_metering_1 <- as.numeric(df2$Sub_metering_1)

df2$Sub_metering_2 <- as.numeric(df2$Sub_metering_2)

df2$Sub_metering_3 <- as.numeric(df2$Sub_metering_3)

png(filename = "Plot2.png", height = 480, width = 480, units = "px", pointsize = 12)

plot(df2$Date, df2$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowats)")



dev.off()


