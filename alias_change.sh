#!/bin/sh


if [ -z $3 ];
then
    echo ""
    echo "    Usage:"
    echo "        `basename $0` \$OLD_INDEX \$INDEX_ALIAS \$NEW_INDEX"
    echo ""

    exit
fi

curl -XPOST 'http://localhost:9200/_aliases?pretty' -d "
{
    \"actions\" : [
        { \"remove\" : { \"index\" : \"$1\", \"alias\" : \"$2\" } },
        { \"add\" : { \"index\" : \"$3\", \"alias\" : \"$2\" } }
    ]
}
"
