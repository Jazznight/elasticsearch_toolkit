
curl "localhost:9200/$1/$2/_analyze?pretty=1&analyzer=my_ngram_analyzer" -d "$3"
