fileName <- "household_power_consumption.txt"
rowsToSkip <- 66637
rowsToRead <- 2880

colNames <- c("Date" , "Time", "Global_active_power", "Global_reactive_power",
              "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2",
              "Sub_metering_3")

setAs("character","dateClass", function(from) {as.Date(from, format="%d/%m/%Y")})

colTypes <- c("dateClass", "character", "numeric", "numeric", "numeric", "numeric", 
               "numeric", "numeric", "numeric")

df <- read.table(fileName, sep = ";", skip = rowsToSkip, nrow = rowsToRead, 
                 col.names = colNames, colClasses = colTypes)

png("plot1.png", width = 480, height = 480)

hist(df$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.off()