curl -XPOST "10.20.0.170:9200/$1/_close"

curl -XPUT "http://10.20.0.170:9200/$1/$2/_mappings?pretty=True" -d '{
"geography" : {
    "mappings" : {
      "barangay" : {
        "properties" : {
          "b_name" : {
            "type" : "string",
	    "search_analyzer": "barangay_analyzer"
          },
          "b_pob" : {
            "type" : "string",
            "search_analyzer":"barangay_analyzer"
          },
          "b_raw" : {
            "type" : "string",
	    "search_analyzer":"barangay_analyzer"
          },
          "city" : {
            "properties" : {
              "_id" : {
                "type" : "string"
              },
              "barangays" : {
                "type" : "long"
              },
              "c_name" : {
                "type" : "string",
		"search_analyzer":"barangay_analyzer"
              },
              "c_pob" : {
                "type" : "string",
		"search_analyzer":"barangay_analyzer"
              },
              "c_raw" : {
                "type" : "string",
		"search_analyzer":"barangay_analyzer"
              },
              "is_capital" : {
                "type" : "boolean"
              },
              "is_city" : {
                "type" : "boolean"
              },
              "type" : {
                "type" : "string"
              }
            }
          },
          "is_capital" : {
            "type" : "boolean"
          },
          "province" : {
            "properties" : {
              "_id" : {
                "type" : "string"
              },
              "barangays" : {
                "type" : "long"
              },
              "cities" : {
                "type" : "long"
              },
              "is_province" : {
                "type" : "boolean"
              },
              "municipalities" : {
                "type" : "long"
              },
              "p_name" : {
                "type" : "string",
		"search_analyzer":"barangay_analyzer"
              },
              "p_pob" : {
                "type" : "string",
		"search_analyzer":"barangay_analyzer"
              },
              "p_raw" : {
                "type" : "string",	
		"search_analyzer":"barangay_analyzer"
              },
              "type" : {
                "type" : "string"
              }
            }
          },
          "region" : {
            "properties" : {
              "_id" : {
                "type" : "string"
              },
              "barangays" : {
                "type" : "long"
              },
              "cities" : {
                "type" : "long"
              },
              "municipalities" : {
                "type" : "long"
              },
              "provinces" : {
                "type" : "long"
              },
              "r_name" : {
                "type" : "string",
		"search_analyzer":"barangay_analyzer"
              },
              "r_pob" : {
                "type" : "string",
		"search_analyzer":"barangay_analyzer"
              },
              "r_raw" : {
                "type" : "string",	
		"search_analyzer":"barangay_analyzer"
              },
              "type" : {
                "type" : "string"
              }
            }
          },
          "type" : {
            "type" : "string"
          }
        }
      }
    }
  }
}'

curl -XPOST "http://10.20.0.170:9200/$1/_open"
