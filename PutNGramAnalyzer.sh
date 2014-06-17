curl -XPUT "localhost:9200/$1" -d "
{
       \"settings\" : {
            \"analysis\" : {
                \"analyzer\" : {
                    \"my_ngram_analyzer\" : {
                        \"tokenizer\" : \"my_ngram_tokenizer\"
                    }
                },
                \"tokenizer\" : {
                    \"my_ngram_tokenizer\" : {
                        \"type\" : \"nGram\",
                        \"min_gram\" : \"1\",
                        \"max_gram\" : \"3\",
                        \"token_chars\": [\"letter\", \"digit\" ]
                    }
                }
            }
        }
    }"
