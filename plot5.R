library(plyr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

BaltimoreMV <- subset(NEI, fips == "24510" & type=="ON-ROAD")

BaltimoreMVpm25byyear <- ddply(BaltimoreMV, .(year), function(x) sum(x$Emissions))
colnames(BaltimoreMVpm25byyear)[2] <- "Emissions"

png("plot5.png")
qplot(year, Emissions, data=BaltimoreMVpm25byyear, geom="line") +
        ggtitle(expression("Baltimore City" ~ PM[2.5] ~ "Motor Vehicle Emissions by Year")) +
        xlab("Year") +
        ylab(expression("Total" ~ PM[2.5] ~ "Emissions (tons)"))
dev.off()