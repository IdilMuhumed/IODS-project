hd <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human_development.csv", stringsAsFactors = F)
gii <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/gender_inequality.csv", stringsAsFactors = F, na.strings = "..")
str(hd)
dim(hd)
summary(hd)
str(gii)
dim(gii)
summary(gii)

head(gii)
library(dplyr)
rename(gii, FeseconEdu = Population.with.Secondary.Education..Female.)
names(gii)
names(gii)[7] <- "FeSecondEdu" 
names(gii) [8] <- "MaSecondEdu"
names(gii)
names(gii)[3] <- "AdolesBirRa"
names(gii) [6] <- "ParlamRep"
names(gii) [4] <- "MatMortRatio"
names(gii) [9] <- "LabForParFe"
names(gii) [10] <- "LabForParMa"
names(gii)
names(hd)
names (hd) [3] <- "HDI"
names (hd) [4] <- "LEB"
names (hd) [5] <- "ExYeEdu"
names (hd) [6] <- "MEYED"
names (hd) [7] <- "GNI"
names (hd) [8] <- "GNI,HDI"
names(hd)
gii$edu2Fedu2M <- (gii$FeSecondEdu + gii$MaSecondEdu) / 2
gii$labFlabM <- (gii$LabForParFe + gii$LabForParMa) / 2

library(dplyr)
human <- inner_join (gii, hd)

str(human)
  
