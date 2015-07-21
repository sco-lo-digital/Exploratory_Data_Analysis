#Scott JAcobs
#Exploratory Data Analysis
#Course Project 2

#Question 1

#Read in the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Aggregate yearly totals of emissions by year
yearlyTotals <- aggregate(Emissions ~ year,NEI, sum)

#Save file to PNG
png(filename= "plot1.png", width = 480, height = 480, pointsize = 12, bg="white")

#Plot the resulting data set
plot(yearlyTotals, main="Total Emmissions by Year", xaxt="n")
  axis(1, xaxp=c(1999,2008, by = 3), las=2)
    lines(yearlyTotals)
#Close device
dev.off()