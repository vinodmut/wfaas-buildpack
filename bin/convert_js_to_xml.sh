#!/bin/bash

# Convert .jsflow scripts to .flow.

#SCRIPTDIR=$(cd $(dirname "$0") && pwd)

SCRIPTSDIR="$1"

# Convert jsflow files.
find "$SCRIPTSDIR" -name \*.jsflow |while read line; do
        jsflowfile="$line"
	jsflowdir=$(dirname "$jsflowfile")
	jsflowname=$(basename "$jsflowfile" .jsflow)
        flowdir="$jsflowdir/$jsflowname"
        flowfile="$flowdir"/index.flow
	echo $jsflowfile $flowdir $flowfile
        mkdir -p "$flowdir"
	curl -H "Content-Type: text/plain" -d @"$jsflowfile" "http://vmuthusfileserver.stage1.ng.bluemix.net/translate?name=$jsflowname" > "$flowfile"
done
