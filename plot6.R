#Scott JAcobs
#Exploratory Data Analysis
#Course Project 2

#Read in the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subset the data pertaining to Baltimore and LA
BaltLA<-NEI[NEI$fips %in% c("24510", "06037"),]
#Subset the data pertaining to type = ON-ROAD (Motor Vehicles)
BaltLARoad<-BaltLA[BaltLA$type=="ON-ROAD",]

#Aggregate the emissions by year
yearlyBaltLA<- aggregate(Emissions ~ fips+ year,BaltLARoad, sum)
#Save file to PNG
png(filename= "plot6.png", width = 580, height = 580, pointsize = 12, bg="white")
#Graph the resulting data set
print(qplot(year, Emissions, data = yearlyBaltLA, color = fips, 
      geom = c("point","smooth"),method="lm"))
#Close device
dev.off()