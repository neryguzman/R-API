load("tidyverse_LDA_topic_modelling.RData")

#* @post /LDA
topic = function(fn,k_value)
{
  #filenames = list.files(curr_dir, pattern = "*.txt")
  files = lapply(filenames, readLines)
  articles.corpus = Corpus(VectorSource(files))
  articles.corpus = tm_map(articles.corpus, tolower)
  articles.corpus = tm_map(articles.corpus, removePunctuation)
  articles.corpus = tm_map(articles.corpus, removeNumbers)
  stopword = c(stopwords('english'),"best")
  articles.corpus = tm_map(articles.corpus, removeWords, stopword)
  articles.corpus = tm_map(articles.corpus, stemDocument)
  #articleDtm2 = createDTM(articles.corpus)
  
  dtm1 = DocumentTermMatrix(articles.corpus, control = list(minWordLength = 3))
  articleDtm2 = removeSparseTerms(dtm1, sparse = 0.98)
  
  rowTotal = apply(articleDtm2, 1,sum)
  f_dtm = get_f_dtm(articleDtm2)
  
  article.lda = LDA(f_dtm, k = k_value, control = list(seed = 1234))
  lda.topics  = as.matrix(topics(article.lda))
  
  
  lda.terms = terms(article.lda)
  lda.terms
  terms = as.character(lda.terms)
  #lda_items = list(lda.topics,lda.terms)
  return(lda.terms)
}