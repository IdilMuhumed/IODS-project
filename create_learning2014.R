#Idil Muhumed, 09.11.2021. 
# This is task 2
data <- "create_learning2014.R"
data
x = read.table("~/Desktop/JYTOPKYS3-data.txt", sep = "\t", header = TRUE)
str(x)
head(x)
dim(x)
x$deep
# The data consists of 60 variables and 183 observations. There is an information about age, gender and attitude.
deep_questions <- c("D03", "D11", "D19", "D27", "D07", "D14", "D22", "D30", "D06",  "D15", "D23", "D31")
library(dplyr)
deep_columns <- select(x, one_of(deep_questions))
x$deep <- rowMeans(deep_columns)

surface_questions <- c("SU02","SU10","SU18","SU26", "SU05","SU13","SU21","SU29","SU08","SU16","SU24","SU32")
surface_columns <- select(x, one_of(surface_questions))
x$surf <- rowMeans(surface_columns)
strategic_questions <- c("ST01","ST09","ST17","ST25","ST04","ST12","ST20","ST28")
strategic_columns <- select(x, one_of(strategic_questions))
x$stra <- rowMeans(strategic_columns)
x$Attitude
x$attitude <- x$Attitude / 10
x$attitude

x$Points

y = cbind(x$Age, x$gender, x$attitude, x$stra, x$surf, x$deep, x$Points)
head(y)
dim(y)

setwd("~/IODS-project")

write.csv(data, "create_learning2014.csv")

data <- "create_learning2014"



