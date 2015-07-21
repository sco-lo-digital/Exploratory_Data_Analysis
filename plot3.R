#Scott JAcobs
#Exploratory Data Analysis
#Course Project 2

#Question 3

#Load ggplot2
library(ggplot2)
#Read in the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subset out Baltimore from the original data
balt<-NEI[NEI$fips=="24510",]

#Aggregate the data by summing emmissions by type over year
yearlyByType <- aggregate(Emissions ~ type + year,balt, sum)

#Save file to PNG
png(filename= "plot3.png", width = 580, height = 580, pointsize = 12, bg="white")
#Plot this information using GGPLOT2
#Addeed regression line so you can see trend
print(qplot(year, Emissions, data = yearlyByType, facets = .~type, geom = c("point","smooth"),method="lm"))

#Close device
dev.off()