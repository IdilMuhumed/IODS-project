#Idil Muhumed 19.11.2021
#I am doing now task number 3

#The data source is :
  "http://archive.ics.uci.edu/ml/machine-learning-databases/00320/student.zip"

  write.table("create_alc_correct_file.R", "data/create_alc_correct_file.R")
 
  
por <- read.table ("~/IODS-project/data/student/student-por.csv", sep = ";", header=TRUE)
math <- read.table("~/IODS-project/data/student/student-mat.csv", sep = ";", header=TRUE )
str(por)
dim(por)

str(math)
dim(math)

library(dplyr)
por_id <- por %>% mutate(id=1000+row_number()) 
math_id <- math %>% mutate(id=2000+row_number())  

free_cols <- c("id","failures","paid","absences","G1","G2","G3")
join_cols <- setdiff(colnames(por_id),free_cols)
pormath_free <- por_id %>% bind_rows(math_id) %>% select(one_of(free_cols))

pormath <- por_id %>% 
  bind_rows(math_id) %>%
  group_by(.dots=join_cols) %>% 
  summarise(n=n(),
            id.p=min(id),
            id.m=max(id),
            failures=round(mean(failures)),     #  Rounded mean for numerical
            paid=first(paid),                   #    and first for chars
            absences=round(mean(absences)),
            G1=round(mean(G1)),
            G2=round(mean(G2)),
            G3=round(mean(G3))    
  ) %>%
  filter(n==2, id.m-id.p>650) %>%  
  inner_join(pormath_free,by=c("id.p"="id"),suffix=c("",".p")) %>%
  inner_join(pormath_free,by=c("id.m"="id"),suffix=c("",".m")) %>%
  
  ungroup %>% mutate(
    alc_use = (Dalc + Walc) / 2,
    high_use = alc_use > 2,
    cid=3000+row_number()
  )

library(openxlsx)
write.xlsx(pormath,file="~/IODS-project/data/pormath.xlsx")  

str(pormath)
dim(pormath)

# if that first column  vector is numeric...
if(is.numeric(first_column)) {
  # take a rounded average of each row of the two columns and
  # add the resulting vector to the alc data frame
  alc[column_name] <- round(rowMeans(two_columns))
} else { # else if it's not numeric...
  # add the first column vector to the alc data frame
  alc[column_name] <- first_column
}
}
  
  pormath$alc_use<- round(rowMeans(pormath$Dalc, pormath$Walc))
  
  high_use <- alc_use > 2
  
glimpse(pormath)

  write.table("pormath", "data/pormath")
  
