plot3 <- function(){
	powerData <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.string='?') # setting ? to na
	elecData <- mutate(powerData,newDate=as.Date(Date,"%d/%m/%Y")) # converting to date format
	filData <- filter(elecData,(newDate=="2007-02-01")|(newDate=="2007-02-02")) # filtering required dates
	filData <- mutate(filData,dt=paste(newDate,Time)) #Pasting date and time to get a combined view later on.
	png("plot3.png", height=480, width=480)
	with(filData,{
		plot(strptime(dt,"%F %T"),Sub_metering_1,ylab="Energy sub metering",xlab="",col="black",type="s")
		lines(strptime(dt,"%F %T"),Sub_metering_2,col="Red")
		lines(strptime(dt,"%F %T"),Sub_metering_3,col="blue")
 	})
 	legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c('black', 'red', 'blue'))
 	dev.off()
}