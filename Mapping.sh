#!/bin/sh

if [ -z $2 ];
then
    echo ""
    echo "    Usage:"
    echo "        `basename $0` \$INDEX_NAME \$TYPE_NAME"
    echo ""
    exit
fi

curl -XPOST "localhost:9200/$1/_close"

curl -XPUT "localhost:9200/$1/$2/_mappings?pretty" -d @run/`basename $0|sed -e s/.sh/.json/g`

curl -XPOST "localhost:9200/$1/_open"
