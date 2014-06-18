#!/bin/sh


if [ -z $1 ];
then
    echo ""
    echo "    Usage:"
    echo "        `basename $0` \$INDEX_NAME"
    echo ""
    exit
fi

curl -XPOST "localhost:9200/$1/_close"

curl -XPUT "localhost:9200/$1/?pretty" 
curl -XPUT "localhost:9200/$1/_settings?pretty" -d @run/`basename $0|sed -e s/.sh/.json/g`

curl -XPOST "localhost:9200/$1/_open"
