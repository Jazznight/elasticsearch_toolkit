#!/bin/sh
curl -i -XGET "localhost:9200/ck101/article/_search?pretty" -d "{
  \"query\": { 
    \"multi_match\": {
      \"tie_breaker\": 0,
      \"query\":\"$1\",
      \"fields\":[\"subject\", \"message\"  ]
    }  
  } 
}"
