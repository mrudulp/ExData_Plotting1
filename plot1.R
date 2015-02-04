plot1 <- function(){
	powerData <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.string='?') # setting ? to na
	elecData <- mutate(powerData,newDate=as.Date(Date,"%d/%m/%Y")) # converting to date format
	filData <- filter(elecData,(newDate=="2007-02-01")|(newDate=="2007-02-02")) # filtering required dates
	png("plot1.png", height=480, width=480)
	hist(as.numeric(filData$Global_active_power),col="red",xlab="Global Active Power(kilowatts)",main="Global Active Power")
	dev.off()
}