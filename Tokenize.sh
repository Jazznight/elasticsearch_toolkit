#!/bin/sh

#curl -i -XGET 'http://localhost:9200/device/models/_search?pretty' -d '{ "query": { "match": { "general_vendor": "HTC" } } } '

if [ -z $2 ];
then
    echo ""
    echo "    Usage:"
    echo "        `basename $0` \$INDEX_NAME \$STRING_FOR_TOKENIZE [\$ANALYZER_NAME]"
    echo ""
    exit
fi

if [ ! -z $3 ];
then
    ANALYZER="&analyzer=$3"
    echo $ANALYZER
fi

#curl -i -XGET 'http://localhost:9200/device_mongo/models/_search?pretty' -d "
curl -i -XGET "http://localhost:9200/$1/_analyze?field=b_raw&pretty$ANALYZER" -d "$2"
