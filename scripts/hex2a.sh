temp=$(cat $1)
echo $temp
for i in {110..2..2}
do
    #echo "i am $i"
    temp=$(echo $temp | sed "s/./&, 0x/$i")
done
echo "{0x$temp}"
