# Question 1                                                    RP April 5, 2016
#Compair total PM2.5 between 1999, 2002, 2005, and 2008

#use Base plot system.

#set wd to dir of file to ensure files are found properly within dir
this.dir <- dirname(parent.frame(2)$ofile) 
setwd(this.dir)

#test to see if pm25 exists in the global environment to save reading time
if(!exists("pm25", .GlobalEnv)){
    pm25 <- readRDS("summarySCC_PM25.rds")
    
}

#calculate the total pm2.5 for each year measured
tot <- with(pm25, tapply(Emissions, year, sum))

#open the PNG device
png(filename = "plot1.png", width = 480, height = 480, units = "px")

#create the plot for the data
plot(names(tot), tot, pch=16, xlab = "Year", ylab = "PM2.5 (in tonnes)")
lines(names(tot), tot, lwd = 2)
par(title(main="Total PM2.5 in each year"))

#close PNG device
dev.off()
