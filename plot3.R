library(plyr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

Baltimore<-NEI[NEI$fips=="24510",]
type_pm25_by_year<-ddply(Baltimore,.(year,type),function(x)sum(x$Emissions))
colnames(type_pm25_by_year)[3]<-"Emissions"

png("plot3.png")
qplot(year,Emissions,data=type_pm25_by_year,color=type,geom="line")+ggtitle(expression("Baltimore City"~PM[2.5]~"Emissions by Source Type and Year"))+xlab("Year")+ylab(expression("Total"~PM[2.5]~"Emissions(tons)"))
dev.off()