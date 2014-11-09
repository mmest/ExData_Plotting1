### Source this script and run 'plot2()' to generate file plot2.png.
### 
### N.B. This script sources script plot1.R to load auxiliary function(s) 
###      and to check for required package(s). 

# Function 'plot2' generates file 'plot2.png'. 

plot2 <- function() {
  DT <- loadData()
  png("plot2.png")
  
  def.off()
}