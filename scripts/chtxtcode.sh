cp -p "$1" tmp
iconv -f gb2312 -t utf-8 "$1" > tmp & mv tmp "$1"
