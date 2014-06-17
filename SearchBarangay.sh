#!/bin/sh
curl -i -XGET "localhost:9200/geography/barangay/_search?pretty" -d "{
  \"query\": { 
    \"multi_match\": {
      \"tie_breaker\": 0.3,
      \"query\":\"$1\",
      \"fields\":[\"b_name\", \"b_raw\", \"b_pob\"  ]
    }  
  } 
}"
