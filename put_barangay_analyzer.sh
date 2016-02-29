curl -XPOST "localhost:9200/$1/_close"

curl -XPUT "localhost:9200/$1/_settings?pretty=True" -d '
{
    "analysis" : {
        "analyzer" : {
            "barangay_analyzer" : {
                "tokenizer" : "barangay_tokenizer",
                "filter": [ "barangay_lowercase_filter", "barangay_delimiter_filter"]
            }
        },
        "tokenizer" : {
            "barangay_tokenizer" : {
                "type" : "edgeNGram",
                "min_gram" : "3",
                "max_gram" : "20",
                "token_chars": [ "letter", "digit" ]
            }
        },
        "filter": {
            "barangay_lowercase_filter" : {
                "type" : "lowercase"
            },
            "barangay_delimiter_filter" : {
                "type" : "word_delimiter",
                "generate_word_parts" : "false",
                "generate_number_parts" : "false",
                "catenate_words" : "false",
                "catenate_numbers" : "false",
                "catenate_all" : "false",
                "split_on_case_change" : "false",
                "preserve_original" : "false",
                "split_on_numerics" : "false",
                "stem_english_possessive" : "false",
                "stem_english_possessive" : "false",
                "type_table" : [ " - => DIGIT" ]
            }
        }
    }
}
'

curl -XPOST "localhost:9200/$1/_open"

