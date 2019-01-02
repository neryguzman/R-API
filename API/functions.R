library(tidytext)
library(stringr)
library(readtext)
library(dplyr)
library(topicmodels)
library(wordcloud)
library(tm)
library(SnowballC)
library(ldatuning)
library(tidyr)
library(ggplot2)
library(jsonlite)



getValueOfK = function(dtm) {
  result <- FindTopicsNumber(
    dtm,
    topics = seq(from = 2, to = 10, by = 1),
    metrics = c("Griffiths2004", "CaoJuan2009", "Arun2010", "Deveaud2014"),
    method = "Gibbs",
    control = list(seed = 77),
    mc.cores = 2L,
    verbose = TRUE
  )
  
  return(result)
}

get_f_dtm = function(artdm2) {
  f_dtm = artdm2[apply(artdm2, 1,sum) > 0,]
  return(f_dtm)
}


createDTM = function(corp){
  dtm1 = DocumentTermMatrix(corp, control = list(minWordLength = 3))
  dtm2 = removeSparseTerms(dtm1, sparse = 0.98)
  return(dtm2)
}