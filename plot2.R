#Scott Jacobs
#Exploratory Data Analysis
#Course Project 2

#Question 2


#Read Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subset the data pertaining to Baltimore
balt<-NEI[NEI$fips=="24510",]
#Aggregate the emissions by year
yearlyTotals <- aggregate(Emissions ~ year,balt, sum)
#Save file to PNG
png(filename= "plot2.png", width = 480, height = 480, pointsize = 12, bg="white")
#Plot the resulting data set
plot(yearlyTotals, main="Total Emmissions by Year for Baltimore City", xaxt="n")
  axis(1, xaxp=c(1999,2008, by = 3), las=2)
    lines(yearlyTotals)
#Close device
dev.off()