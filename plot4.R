
## Load dependancies
library(dplyr)

if(!exists("pm25", .GlobalEnv)){ #test to see if pm25 exists in the global environment to save reading time
    pm25 <- readRDS("summarySCC_PM25.rds")
    
}


if(!exists("scc", .GlobalEnv)){
    scc <- readRDS("Source_classification_Code.rds") # Load "Source_Classification_Code.rds"  as a dataframe.
}
# Read through to find entries containing coal in SCC.Level.Three and filter by that.
scc.coal <- filter(scc, grepl("Coal", SCC.Level.Three) & 
                       !(grepl("Coal Mining", SCC.Level.Three)|grepl("Coal Bed", SCC.Level.Three)))

## compair scc column in ssc.coal to select from pm2.5 database
pm25.coal <- pm25[pm25$SCC %in% scc.coal$SCC,]

## Plot total pm2.5 over each yeah from coal sources
c <- ggplot(pm25.coal, aes(as.factor(year), Emissions))
c+geom_bar(stat = "identity")
# TODO add better lables

ggsave("plot4.png")
