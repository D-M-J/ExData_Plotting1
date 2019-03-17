# Reads  data from file and selects the subset for specified dates

AllData<- read.csv("household_power_consumption.txt", header= TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE, dec=".")
Dataset <- AllData[AllData$Date %in% c("1/2/2007","2/2/2007") ,]



# Combines "Date" and "Time" and converts to date
Dataset$Date <- as.Date(Dataset$Date, format="%d/%m/%Y")
Date_Time <- paste(as.Date(Dataset$Date), Dataset$Time)
Dataset$Date_Time <- as.POSIXct(Date_Time)


# plots graphse on screen
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(Dataset, {
        plot(Global_active_power~Date_Time, type="l", ylab="Global Active Power (kilowatts)", xlab="")
        plot(Voltage~Date_Time, type="l", ylab="Voltage (volt)", xlab="")
        plot(Sub_metering_1~Date_Time, type="l", ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Date_Time,col='Red')
        lines(Sub_metering_3~Date_Time,col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power~Date_Time, type="l", 
             ylab="Global Rective Power (kilowatts)",xlab="")
})

# Plots Global Active Power versus Date_Time as png
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()