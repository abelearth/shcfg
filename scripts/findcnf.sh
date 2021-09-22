#!/bin/sh
DIR=$1
echo "Finding files coding with No-ASCII in directory" `pwd $DIR`

find $DIR -name *.c -o -name *.h | xargs -I{} file {} | grep Unicode | awk -F ':' '{print $1}' > /tmp/files
for i in `cat /tmp/files`
do
    echo "$i"
done
