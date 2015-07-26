NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

Baltimore<-NEI[NEI$fips=="24510",]
total_pm25_by_year_bal<-tapply(Baltimore$Emissions,Baltimore$year,sum)

png("plot2.png")
plot(names(total_pm25_by_year_bal),total_pm25_by_year_bal,type="l",xlab="Year",ylab=expression("Total"~PM[2.5]~"Emissions(tons)"),main=expression("Total Baltimore City"~PM[2.5]~"Emission by Year"))
dev.off()