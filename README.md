taset Description:
The data set used in this project is taken from 301 unique papers that was submitted through Simon Fraser University’s submission system. Each line in DocumentWord.txt consist of 3 main parts (codes in integer format) in the following format:
di,ki,wi1,wi2,…,wik
Where di corresponds to id of the i-th submitted paper, ki is the number of unique words that were used in this paper, and wi1,wi2,…,wik are the words. Also all the stop words are removed from the data.
There are four main subjects that each of these papers belongs to. However, we have no indication that which paper is written under what subject/ category.
Project description:
This project is to predict and identify which the subject of each paper. By using clustering technique in data mining.
Summary of the approach:
First, in the preprocessing step I removed ki column from each line. Since this number would not help us in clustering process.
Then, I used R to analyzed the preprocessed data. I scanned each line of the preprocessed data and generate a matrix djwi where wi corresponds to each word id and dj corresponds to each document existed in the DocumentWords. The matrix stores of 0s and 1s. The 1 corresponds to existence of the word in a document and 0 means the word does not exist in that document. Then, I scanned the matrix to find frequency of each word and stored it in freq.csv file. Next, I scanned freq.csv that was generated in the previous step and cut down the words that have very high and very low frequencies ( I omitted all the words that have frequency of above 110 and those that are below 48). The reason for cutting those high frequent ones is that we are not interested on words such as “because” or “for instance” which are very likely to exist in majority of the documents. The reason for omitting least frequent ones is that they would not be helpful in clustering. Then, after having a clean format of words and frequencies result, I deleted the fi column from it since we don’t need it for further examinations. 
Then I used KMeans function for clustering the data and store the result in a file called result.csv with two columns, the first column corresponds to the paper ids and the second one the cluster number of each paper.

