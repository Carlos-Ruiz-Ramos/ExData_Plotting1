
library(data.table)
library(png)

Datos = fread("household_power_consumption.txt", sep = ";", na.strings="?")

Datos = data.table(Datos)

Datos$Fecha_Hora = paste(Datos$Date, Datos$Time, sep = " ")

Datos$Date = as.Date(Datos$Date,"%d/%m/%Y")

Datos = Datos[Date >= '2007-02-01' & Date <= '2007-02-02',]
Datos$Global_active_power = as.numeric(Datos$Global_active_power)
?strptime
Datos$Nuevo = as.POSIXct(strptime(Datos$Fecha_Hora, "%d/%m/%Y %H:%M:%S"))

png("plot4.png",width=480,height=480)

?par

par(mfrow=c(2,2))

?plot

plot(x=Datos$Nuevo,
     y=Datos$Global_active_power, 
     type = "l",
     ylab="Global Active Power (Kilowatts)",
     xlab="")

plot(x=Datos$Nuevo,
     y=Datos$Voltage, 
     type = "l",
     ylab="Voltage",
     xlab="datetime")

plot(x=Datos$Nuevo,
     y=Datos$Sub_metering_1, 
     type = "l",
     ylab="Energy sub metering",
     xlab="")
lines(x=Datos$Nuevo,
      y=Datos$Sub_metering_2, col="red")
lines(x=Datos$Nuevo,
      y=Datos$Sub_metering_3, col="blue")
legend('topright', 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1,
       col=c("black","red","blue"))

plot(x=Datos$Nuevo,
     y=Datos$Global_reactive_power, 
     type = "l",
     ylab="Global_reacytive_power",
     xlab="datetime")


dev.off()
