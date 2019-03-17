
# Reads  data from file and selects the subset for specified dates
AllData<- read.csv("household_power_consumption.txt", header= TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE, dec=".")
Dataset <- AllData[AllData$Date %in% c("1/2/2007","2/2/2007") ,]

# Plots Global Active Power versus Date_Time on screen
hist(Dataset$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power(kilowatts)")

# plots histogram of "Global Active Power" as png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()