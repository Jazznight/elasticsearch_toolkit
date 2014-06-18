#!/bin/sh

if [ -z $1 ];
then
    echo ""
    echo "    Usage:"
    echo "        `basename $0` \$INDEX_NAME"
    echo ""
    exit
fi

curl -XDELETE "localhost:9200/$1/?pretty"
