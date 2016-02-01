library(tm)

#(header-FALSE, stringsAsFactors = FALSE, fileEncoding="latin1")

#setting the working directory
setwd("/Users/Parinaz/Desktop/projectdata")
      
#reading the required file in to data
data <- read.csv("documentwords_transpose.csv")
#generating a corpus
corpus <- Corpus(VectorSource(data))

#generating the Document Term Matrix, rows: 301 (documents), columns: 7184 (words)
dtm <- DocumentTermMatrix(corpus)


#this will remove the words c(51,109) gives 99.09211, c(50,110) gives 98.99, c(52,105) gives 98.52
dtm <- DocumentTermMatrix(corpus, control = list(wordLengths=c(),bounds = list(global = c(48,110))))

#removes terms with sparsity > 80%
#dtm <- removeSparseTerms(x=dtm,sparse = 0.80)

dtm_tfxidf <- weightTfIdf(dtm)

m <- as.matrix(dtm_tfxidf)

rownames(m) <- sub("X","",colnames(data))

norm_eucl <- function(m)
  m/apply(m, 1, function(x) sum(x^2)^.5)

m_norm <- norm_eucl(m)

set.seed(19999) #accuracy is 90.95

results <- kmeans(m_norm, 4, 20)

x <- results$cluster

write.csv(x,file = "results.csv")
