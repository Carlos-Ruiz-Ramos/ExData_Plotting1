
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

png("plot2.png",width=480,height=480)

?plot

plot(x=Datos$Nuevo,
     y=Datos$Global_active_power, 
     type = "l",
     ylab="Global Active Power (Kilowatts)",
     xlab="")

dev.off()
