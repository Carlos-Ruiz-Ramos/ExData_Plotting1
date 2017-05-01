
library(data.table)
library(png)


setwd("C:/Users/ax25918/Desktop/Trainning/Coursera/Getting_and_Cleaning_Data/Ultimo")

Datos = fread("household_power_consumption.txt", sep = ";", na.strings="?")

Datos = data.table(Datos)
Datos$Date = as.Date(Datos$Date,"%d/%m/%Y")
Datos$Global_active_power = as.numeric(Datos$Global_active_power)
Datos = Datos[Date >= '2007-02-01' & Date <= '2007-02-02',]


png("plot1.png",width=480,height=480)

hist(Datos$Global_active_power, 
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     col="red"
)
dev.off()
