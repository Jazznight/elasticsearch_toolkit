#!/bin/sh

mvn > /dev/null 2>&1
if [ $? -ne 0 -a $? -ne 1 ];
then
    echo "" echo "    ERROR: Please install the JAVA build tool [maven] before install ik plugin."
    echo ""
    exit
fi

if [ -z $1 ];
then
    echo ""
    echo "    Usage:"
    echo "        ./`basename $0` \$VERSTION_TAG"
    echo ""
    echo "        e.g. ./`basename $0` v1.10.0"
    echo ""
    exit
fi

VERSION=$1

ES_HOME=${ES_HOME-/usr/share/elasticsearch}

INST_DIR=/tmp/inst_es
mkdir -p $INST_DIR
cd $INST_DIR

git clone https://github.com/medcl/elasticsearch-analysis-ik
cd elasticsearch-analysis-ik
git checkout $VERSION
mvn clean
mvn compile
mvn package


unzip -o -d $ES_HOME/plugins/ik $INST_DIR/elasticsearch-analysis-ik/target/releases/*.zip
if [ $? -ne 0 ];
then
    sudo unzip -o -d $ES_HOME/plugins/ik $INST_DIR/elasticsearch-analysis-ik/target/releases/*.zip
fi
