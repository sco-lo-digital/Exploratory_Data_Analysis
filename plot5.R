#Scott JAcobs
#Exploratory Data Analysis
#Course Project 2

#Question 5
#Read in the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subset the data pertaining to Baltimore
balt<-NEI[NEI$fips=="24510",]
#Further subset that data to only include motor vehicles as determined by the
#"ON-ROAD" 'type' classification.
road<-balt[balt$type=="ON-ROAD",]
#Aggregate the sum of the emissions data by year
yearlyRoad <- aggregate(Emissions ~ year,road, sum)
#Save file to PNG
png(filename= "plot5.png", width = 580, height = 580, pointsize = 12, bg="white")
#Graph the resulting data set
plot(yearlyRoad, main="Total Emmissions of Motor Vehicles (ON-ROAD) by Year", xaxt="n")
  axis(1, xaxp=c(1999, 2008, by = 3), las=2)
    lines(yearlyRoad)
#Close device
dev.off()