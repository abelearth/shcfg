#!/bin/sh
DIR=$1
echo "Change files coding in directory" `pwd $DIR`

find $DIR -name *.c -o -name *.h | xargs -I{} file {} | grep ISO-8859 | awk -F ':' '{print $1}' > /tmp/files
for i in `cat /tmp/files`
do
    echo "$i"
    iconv -f gb2312 -t utf-8 $i > /tmp/converted && mv /tmp/converted $i
done
