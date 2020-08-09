for d in $*; do
    for f in $(ls $d/*.bat); do
        echo $(mv -v $f ${f%.bat}.txt)
    done
done
