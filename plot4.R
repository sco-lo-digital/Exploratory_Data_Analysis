#Scott JAcobs
#Exploratory Data Analysis
#Course Project 2

#Question 4

#Read in the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subset the data to only include pollutants produced by coal
coal<-NEI[NEI$SCC=="10100101",]

#Aggregate the data by summing by year
yearlyCoal <- aggregate(Emissions ~ year,coal, sum)
#Save file to PNG
png(filename= "plot4.png", width = 580, height = 580, pointsize = 12, bg="white")
#Graph the data set
plot(yearlyCoal, main="Total Coal Emmissions by Year", xaxt="n")
  axis(1, xaxp=c(1999, 2008, by = 3), las=2)
    lines(yearlyCoal)
#Close device
dev.off()