# To generate the 'plot1.png' file source this file and run 'plot1()'. 


# We use the 'data.table' package. If not avail, script asks for it and does not mess with user's library: 
if (!isTRUE(require(data.table))) 
  stop("The 'data.table' package is needed, please use 'install.packages(\"data.table\")' to load it.")

### Function definition(s): 

# Function 'loadData()' selects and loads the appropriate lines for this 
# assignment.
# 
# Returns an enhanced data.frame of class 'data.table' with an added column
# 'datetime' wich collates the 'Date' and 'Time' fields.
# 
# Parameter dataFile' is the data source file. It is  available from: 
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# it should be uncompressed with filename as the default value of parameter. 
# REQUIRES: package 'data.table'. 

loadData <- function(dataFile = "household_power_consumption.txt") {
  
  # Data from days of interest is in rows from 66638 to 69517 for a total of 2880. 
  # As this is a "quick and dirty" data analysis we got the two numbers above by means of
  # a few commands available on Linux, OS X, and cygwin on Windows: 
  # > egrep -n -m 1 -e '^[12]\/2\/2007' household_power_consumption.txt  # first line of interest
  # > egrep -n -m 1 -e '^3\/2\/2007' household_power_consumption.txt # first line AFTER lines of interest. 
  DT <- fread(dataFile, skip = 66637, nrows = 2880, na.strings = '?', )
  
  # Parameter 'skip' defeats header detection, just load columns names now: 
  suppressWarnings( # Suppress 0-row table warning
    DTnames <- fread(dataFile, nrows = 0)  # Reads just the header
  )
  
  # Set columns names in DT:
  setnames(DT, names(DTnames))
  
  # Convert to date and time classes, merge in 1 column'datetime' for plotting.
  DT[ , datetime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S") ]
  
  # I you do as below, datetime will store the no.of minutes since origin time. It is a side-effect of the
  # 'simplyfy' performed by  'mapply'. It may be useful.  
  # DT[ , datetime := mapply(function(d ,t) { as.POSIXct(paste(d, t), format = "%d/%m/%Y %H:%M:%S") }, Date, Time) ]

  return(DT)
}

### TEST: run when sourced: 
DT <- loadData()
png("plot1.png")
hist(DT$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()