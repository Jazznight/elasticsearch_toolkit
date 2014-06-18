#!/bin/sh

if [ -d $3 ];
then
    echo ""
    echo "    Usage:"
    echo "        `basename $0` \$INDEX_NAME \$MODEL_NAME \$RIVER_NAME"
    echo ""
    exit
fi

INDEX=$1
MODEL=$2
RIVER=$3

curl -XDELETE 'http://localhost:9200/_river/mongodb/_riverstatus?pretty'

curl -XDELETE "http://localhost:9200/_river/$RIVER?pretty"
curl -XPUT "localhost:9200/_river/$RIVER/_meta" -d"
{
    \"type\": \"mongodb\",
    \"mongodb\": {
        \"servers\": [ { \"host\": \"localhost\", \"port\": \"27017\" } ],
        \"db\": \"$INDEX\", 
        \"collection\": \"$MODEL\", 
        \"gridfs\": false
    },
    \"index\": {
        \"name\": \"$INDEX\", 
        \"type\": \"$MODEL\"
    }
}"


curl -XPUT 'http://localhost:9200/_snapshot/device_elasticsearch_snapshot' -d '{
    "type": "fs",
    "settings": {
        "location": "/tmp/device_elasticsearch_snapshot",
        "compress": true
    }
}'
