curl -XPOST "localhost:9200/$1/_search?pretty=True" -d "{"query":{"match_all":{}}, "size":$2}"


