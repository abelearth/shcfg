if [ $1 -eq 2 ]; then
sed 's/[[:print:]]/&\xcc\x85\xcc\xb2/g'
else
sed 's/[[:print:]]/&\xd2\x89/g'
fi
