### Source this script and run 'plot3()' to generate file plot3.png.
### 
### N.B. This script sources script plot1.R to load auxiliary function(s) 
###      and to check for required package(s). 
source("plot1.R")

# Function 'plot3' generates file 'plot3.png'. 

plot3 <- function() {
  DT <- loadData()
  png("plot3.png")
  with(DT, plot(datetime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
  with(DT, points(datetime, Sub_metering_1, type = "l", col = "black"))
  with(DT, points(datetime, Sub_metering_2, type = "l", col = "red"))
  with(DT, points(datetime, Sub_metering_3, type = "l", col = "blue"))
  legend("topright",  
         lty = 1, lwd = 2, col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  dev.off()
}