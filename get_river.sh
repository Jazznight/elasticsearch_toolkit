#!/bin/sh

if [ -z $1 ];
then
    echo ""
    echo "    Usage:"
    echo "        `basename $0` \$RIVER_NAME"
    echo ""
    exit
fi

curl -XGET "localhost:9200/_river/$1/_meta?pretty"
