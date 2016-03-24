#!/bin/sh

ES_HOME=${ES_HOME-/usr/share/elasticsearch}

sudo $ES_HOME/bin/plugin install mobz/elasticsearch-head
