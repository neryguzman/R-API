library(tidytext)
library(stringr)
library(readtext)
library(dplyr)
library(topicmodels)
library(tm)
library(SnowballC)
library(ldatuning)
library(tidyr)
library(jsonlite)
library(plumber)

#load("tidyverse_LDA_topic_modelling.RData")

main_dir = getwd()
setwd(main_dir)
r = plumb("LDA_API.R")

file_path = paste0(main_dir,"/data/","")
setwd(file_path)
r$run(port = 8000)

# Run the API using http://localhost:8000/LDA