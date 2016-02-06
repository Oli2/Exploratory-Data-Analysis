#first add the part which will download and unzip the file in the working
# directory


library(dplyr)
library(lubridate)

df <-read.csv("/Users/Macbook_Tom/Downloads/household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)



df1$Date<- paste(df1$Date, df$Time, sep = ' ')

df1<- select(df1, -Time)

df1$Date <- dmy_hms(df1$Date)

df2 <- filter(df1, Date >= "2007-02-01" & Date < "2007-02-03")

df2$Global_active_power <- as.numeric(df2$Global_active_power)

df2$Sub_metering_1 <- as.numeric(df2$Sub_metering_1)

df2$Sub_metering_2 <- as.numeric(df2$Sub_metering_2)

df2$Sub_metering_3 <- as.numeric(df2$Sub_metering_3)
df2$Global_reactive_power <- as.numeric(df2$Global_reactive_power)
df2$Voltage <- as.numeric(df2$Voltage)


png(filename = "Plot4.png", height = 480, width = 480, units = "px", pointsize = 12)

par(mfrow = c(2,2), mar = c(4,4,4,4))
plot(df2$Date, df2$Global_active_power, ylab = "Global Active Power", xlab = "", type ="l")
plot(df2$Date, df2$Voltage, ylab = "Voltage", xlab = "datetime", type ="l")
plot(df2$Date, df2$Sub_metering_1, type = "l", xlab = '', ylab = "Enegry sub metering")
points(df2$Date, df2$Sub_metering_2, type = "l", col="red")
points(df2$Date, df2$Sub_metering_3, type = "l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex = 0.5,lty = c(1,1,1), lwd = c(2.5,2.5,2.5), col = c("black", "red", "blue"))
plot(df2$Date, df2$Global_reactive_power, ylab = "Global Reactive Power", xlab = "datetime", type ="l")


dev.off()


