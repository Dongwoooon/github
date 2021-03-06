setwd("C:\\Users\\DW\\Dropbox\\공부할거\\코딩\\mycode\\r\\thomson")
library(dplyr)
library(sqldf)

data <- read.csv("C:\\Users\\DW\\Dropbox\\Patent\\thomson_merged.csv")
names(data)
data <- subset(data, select = -Company.Website)
data <- subset(data, select = -Company.County)
data <- subset(data, select = -Company.Fax.Number)
data <- subset(data, select = -Company.Fax.Number..Branch.Office.)
data <- subset(data, select = -Company.Nation..Branch.Office.)
data <- subset(data, select = -Company.Phone.Number)
data <- subset(data, select = -Company.Phone.Number..Branch.Office.)
data <- subset(data, select = -Company.Street.Address..Line.1)
data <- subset(data, select = -Company.Street.Address..Line.1..Branch.Office.)
data <- subset(data, select = -Company.Street.Address..Line.2)
data <- subset(data, select = -Company.Street.Address..Line.2..Branch.Office.)
data <- subset(data, select = -Firm.County)
data <- subset(data, select = -Firm.Fax.Number)
data <- subset(data, select = -Firm.Phone.Number)
data <- subset(data, select = -Firm.Street.Address..Line.1)
data <- subset(data, select = -Firm.Street.Address..Line.2)
data <- subset(data, select = -Fund.Website)
data <- subset(clean, select = -Fund.Street.Address..Line.1)
data <- subset(clean, select = -Fund.Street.Address..Line.2)
data <- subset(clean, select = -Fund.Phone.Number)
data <- subset(data, select = -Investment.Location...Street.Address..Line.1)
data <- subset(data, select = -Investment.Location...Street.Address..Line.2)
data <- subset(data, select = -No..of.Real.Estate.Employees)
data <- subset(data, select = -No..of.Real.Estate.Funds.Managed.by.Firm)
data <- subset(data, select = -Unnamed..0)
data <- subset(data, select = -Fund.Fax.Number)

tmp <- arrange(data, Company.Founded.Year)  # founded.year로 오름차순
clean <- na.omit(tmp)
clean2 <- subset(clean, Company.Founded.Year!='-')

names(data)
colnames(data) <- gsub("\\.","_",colnames(data)) #colname의 .을 _로 변경
colnames(data) <- sub("__", "_", colnames(data), fixed=TRUE)        #__를 _로 변경
colnames(data) <- gsub("\\_$", "", colnames(data))                   #~~_를 ~~로 변경
names(data)
fb <- sqldf("select * from data where Company_Name like 'facebook%'")
write.csv(data, "J:\\데이터\\thompson_clean2.csv")