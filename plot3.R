fileName <- "household_power_consumption.txt"
rowsToSkip <- 66637
rowsToRead <- 2880

colNames <- c("Date" , "Time", "Global_active_power", "Global_reactive_power",
              "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2",
              "Sub_metering_3")

colTypes <- c("character", "character", "numeric", "numeric", "numeric", "numeric", 
              "numeric", "numeric", "numeric")

df <- read.table(fileName, sep = ";", skip = rowsToSkip, nrow = rowsToRead, 
                 col.names = colNames, colClasses = colTypes)

df$DateTime <- strptime(paste(df$Date, df$Time), format = "%d/%m/%Y %H:%M:%S")

png("plot3.png", width = 480, height = 480)

plot(df$DateTime, df$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(df$DateTime, df$Sub_metering_2, col = "red")
lines(df$DateTime, df$Sub_metering_3, col = "blue")
legend("topright", lwd = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()