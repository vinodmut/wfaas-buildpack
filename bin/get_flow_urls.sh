#!/bin/bash

# Display the URIs of flows in a given directory.


#SCRIPTDIR=$(cd $(dirname "$0") && pwd)

SCRIPTSDIR="$1"
APPURI="$2"
SPLICEPREFIX=/runtime

#echo SCRIPTSDIR: $SCRIPTSDIR
#echo APPURI: $APPURI

# Look for .jsflow files.
find "$SCRIPTSDIR" -name \*.jsflow |while read line; do
    jsflowfile="$line"
    relativepath=${jsflowfile#$SCRIPTSDIR}
    path=${relativepath%.jsflow}
    echo ${APPURI}${SPLICEPREFIX}${path}/_/ENDPOINT
done
