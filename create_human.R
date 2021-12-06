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
human <- inner_join (gii, hd)
write.table(human, "data/human.txt")

#EXERCISE 5  5.12.2021

library(dplyr)

human <- read.table ("~/IODS-project/data/human.txt", header = TRUE) 
install.packages("stringr")
library(stringr)

#Transforming GNI variable into numeric:

human$GNI <- str_replace(human$GNI, pattern=",", replace ="") %>% as.numeric

colnames(human)
library(dplyr)

# Selecting columns

keep <- c("Country", "GNI", "LEB", "MatMortRatio", "MaSecondEdu", "ExYeEdu", "AdolesBirRa", "LabForParFe", "LabForParMa")

#Omitting missing data

human <- select(human, one_of(keep))
complete.cases(human)
human <- filter(human, complete.cases(human))
str(human)

#Removing observations which relates to regions instead of countries.

human <- subset(human, !(Country %in% c("World", "Europe and Central Asia", "Arab States", "East Asia and the Pacific", "Latin America and the Caribbean", "South Asia", "Sub-Saharan Africa"))) 

#Defining the row names by the country names
rownames(human) <- human$Country

#Deleting Country column
human <- select(human, -Country)
str(human)

# The variable has 155 observations and 8 variables

write.table(human, "data/human.txt")
