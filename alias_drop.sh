#!/bin/sh


if [ -z $2 ];
then
    echo ""
    echo "    Usage:"
    echo "        `basename $0` \$OLD_INDEX \$INDEX_ALIAS "
    echo ""

    exit
fi

curl -XPOST 'http://localhost:9200/_aliases?pretty' -d "
{
    \"actions\" : [
        { \"remove\" : { \"index\" : \"$1\", \"alias\" : \"$2\" } }
    ]
}
"
