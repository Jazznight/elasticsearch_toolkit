#!/bin/sh

cd /mnt/box/infominer

curl -XPUT 'http://localhost:9200/_snapshot/box.com_elasticsearch_snapshot' -d '{
    "type": "fs",
    "settings": {
        "location": "/mnt/box/infominer/es",
        "compress": true
    }
}'

curl -XPOST 'http://localhost:9200/_snapshot/box.com_elasticsearch_snapshot/snapshot_1/_restore'
