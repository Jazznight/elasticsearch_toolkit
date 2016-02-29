curl -XGET "localhost:9200/$1/$2/_search?search_type=scan&scroll=10m&size=50" -d '
{
    "query" : {
        "match_all" : {}
    }
}
'

