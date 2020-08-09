find . -not -iwholename '*.svn*' | xargs file | grep CRLF | sed -n 's/^//;s/:.*$//p' | xargs dos2unix

