# Question 1                                                    RP April 5, 2016
#Compair total PM2.5 between 1999, 2002, 2005, and 2008

#use Base plot system.

#Load packages
library(dplyr)
library(ggplot2)

#set wd to dir of file to ensure files are found properly within dir
this.dir <- dirname(parent.frame(2)$ofile) 
setwd(this.dir)

#test to see if pm25 exists in the global environment to save reading time
if(!exists("pm25", .GlobalEnv)){
    pm25 <- readRDS("summarySCC_PM25.rds")
    
}

#process data
balt <- filter(pm25, fips == "24510")


#create the plot for the data
g <- ggplot(balt, aes(as.factor(year), Emissions))
g + geom_bar(stat = "identity") + facet_grid(type~.)
ggsave("plot3.png")


