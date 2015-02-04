plot2 <- function(){
	powerData <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.string='?') # setting ? to na
	elecData <- mutate(powerData,newDate=as.Date(Date,"%d/%m/%Y")) # converting to date format
	filData <- filter(elecData,(newDate=="2007-02-01")|(newDate=="2007-02-02")) # filtering required dates
	filData <- mutate(filData,dt=paste(newDate,Time)) #Pasting date and time to get a combined view later on.
	png("plot2.png", height=480, width=480)
	plot(strptime(filData$dt,"%F %T"),as.numeric(filData$Global_active_power),type="s",ylab="Global Active Power(kilowatts)",xlab="")
	dev.off()
}