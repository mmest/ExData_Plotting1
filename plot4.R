### Source this script and run 'plot4()' to generate file plot4.png.
### 
### N.B. This script sources script plot1.R to load auxiliary function(s) 
###      and to check for required package(s). 

source("plot1.R")

# Function 'plot4' generates file 'plot4.png'. 

plot4 <- function() {
  DT <- loadData()
  
  png("plot4.png")
  par(mfrow = c(2, 2))

  # Top left
  with(DT, 
       plot(datetime, Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
  )

  # Top right
  with(DT, plot(datetime, Voltage, type = "l") )

  # Bottom left
  with(DT, plot(datetime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
  with(DT, points(datetime, Sub_metering_1, type = "l", col = "black"))
  with(DT, points(datetime, Sub_metering_2, type = "l", col = "red"))
  with(DT, points(datetime, Sub_metering_3, type = "l", col = "blue"))
  legend("topright",  
         lty = 1, lwd = 2, col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

  # Bottom right
  with(DT, plot(datetime, Global_reactive_power, type = "l"))
  
  dev.off()
}