# Reads  data from file and selects the subset for specified dates

AllData<- read.csv("household_power_consumption.txt", header= TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE, dec=".")
Dataset <- AllData[AllData$Date %in% c("1/2/2007","2/2/2007") ,]



# Combines "Date" and "Time" and converts to date
Dataset$Date <- as.Date(Dataset$Date, format="%d/%m/%Y")
Date_Time <- paste(as.Date(Dataset$Date), Dataset$Time)
Dataset$Date_Time <- as.POSIXct(Date_Time)

# Plots Global Active Power versus Date_Time on screen
with(Dataset, {plot(Global_active_power~Date_Time, type="l", ylab="Global Active Power (kilowatts)", xlab="")})

# Plots Global Active Power versus Date_Time as png
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()