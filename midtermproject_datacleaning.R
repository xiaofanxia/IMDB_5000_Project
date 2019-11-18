library(tidyverse)
library(data.table)
library(readr)
#Read in 7 data files
#imdb5000 <- read.csv("movie_metadata.csv")
#setwd("/Users/XiaofanXia/Desktop/MA678/Midterm_project")
imdb1 <- read_tsv("data.tsv")
imdb2 <- read_tsv("data-2.tsv")
imdb3 <- read_tsv("data-3.tsv")
imdb4 <- read_tsv("data-4.tsv")
imdb5 <- read_tsv("data-5.tsv")
imdb6 <- read_tsv("data-6.tsv")
imdb7 <- read_tsv("data-7.tsv")
#Extract data I need and clean them (focusing on movies)
#select the columns I need from dataset 5. (movie: titlename,titleID, year, runtime, genres)
movie <-
  imdb5 %>%
  filter(titleType=="movie") %>% 
  select(tconst,primaryTitle,startYear,runtimeMinutes,genres)
#merge movie dataset with rating dataset by matching titleID(tconst). 
rating <- merge(movie,imdb2,by="tconst")
#merge rating dataset with cast dataset by matching titleID
director_writer <- merge(rating, imdb4,by="tconst")
primary_cast <- merge(rating,imdb1,by="tconst")
primary_cast_new <- merge(primary_cast,imdb7,by="nconst")

#Export my new clean datasets
write.csv(movie,"/Users/XiaofanXia/Desktop/MA678/Midterm_project/movie.csv", row.names = FALSE)
write.csv(rating,"/Users/XiaofanXia/Desktop/MA678/Midterm_project/rating.csv", row.names = FALSE)
write.csv(director_writer,"/Users/XiaofanXia/Desktop/MA678/Midterm_project/director_writer.csv", row.names = FALSE)
write.csv(primary_cast,"/Users/XiaofanXia/Desktop/MA678/Midterm_project/primary_cast.csv", row.names = FALSE)
write.csv(primary_cast_new,"/Users/XiaofanXia/Desktop/MA678/Midterm_project/primary_cast_new.csv", row.names = FALSE)

