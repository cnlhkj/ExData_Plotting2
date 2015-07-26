NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")

total_pm25_by_year<-tapply(NEI$Emissions,NEI$year,sum)

png("plot1.png")
plot(names(total_pm25_by_year),total_pm25_by_year,type="l",xlab="Year",ylab=expression("Total US"~PM[2.5]~"Emission by Year"))
dev.off()