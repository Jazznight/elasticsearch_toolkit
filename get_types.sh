curl -XPOST "localhost:9200/$1/_search?pretty=1" -d '{"query":{"match_all":{}}, "size":100}'
