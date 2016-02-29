#!/bin/sh
curl -i -XGET "localhost:9200/ck101/article/_search?pretty" -d "{
	\"query\":{
		\"bool\":{
			\"must\":[{
				\"query_string\":{
					\"default_field\":\"_all\",
					\"query\":\"$1\"
				}
			}],
			\"must_not\":[],\"should\":[]
		}
	},
	\"from\":0,
	\"size\":10,
	\"sort\":[],
	\"facets\":{}
}"
