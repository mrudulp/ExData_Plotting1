plot4 <- function(){
	powerData <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.string='?') # setting ? to na
	elecData <- mutate(powerData,newDate=as.Date(Date,"%d/%m/%Y")) # converting to date format
	filData <- filter(elecData,(newDate=="2007-02-01")|(newDate=="2007-02-02")) # filtering required dates
	filData <- mutate(filData,dt=paste(newDate,Time)) #Pasting date and time to get a combined view later on.
	png("plot4.png", height=480, width=480)
	par(mfrow=c(2,2)) # Setting no. of rows and cols.
	with(filData,{
		plot(strptime(dt,"%F %T"), as.numeric(Global_active_power),ylab="Global Active Power(kilowatts)",xlab="",type="s")

		plot(strptime(dt,"%F %T"),Voltage,ylab="Voltage",xlab="datetime",col="black",type="s")

		plot(strptime(dt,"%F %T"),Sub_metering_1,ylab="Energy sub metering",xlab="",col="black",type="s")
		lines(strptime(dt,"%F %T"),Sub_metering_2,col="Red")
		lines(strptime(dt,"%F %T"),Sub_metering_3,col="blue")

		plot(strptime(dt,"%F %T"),Global_reactive_power,ylab="Global_reactive_power",xlab="datetime",col="black",type="s")
 	})
 	dev.off()
}