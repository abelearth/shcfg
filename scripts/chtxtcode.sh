#!/bin/sh
if [ $# -eq 0 ]
then
	echo usage $0 files ...
	exit 1
fi

for file in "$@"
do
	echo "# Processing: $file" 1>&2
	if [ ! -f "$file" ]
	then
		echo Not a file: "$file" 1>&2
		exit 1
	fi
	TYPE=`file - < "$file" | cut -d: -f2`
	if echo "$TYPE" | grep -q '(with BOM)'
	then
		echo "# $TYPE, already has BOM, skipping." 1>&2
	else
		if echo "$TYPE" | grep -q 'ISO-8859'
		then
			( mv "${file}" "${file}"~ && iconv -f gb2312 -t utf-8 < "${file}~" > "${file}" ) || ( echo Error processing "$file" 1>&2 ; exit 1)
			printf '\xEF\xBB\xBF' | cat - "${file}" > "${file}.bom" && mv "${file}.bom" "${file}"
			echo "$TYPE, converted to UTF-8(with BOM)"
		else
			if echo "$TYPE" | grep -q 'ASCII text'
			then
				printf '\xEF\xBB\xBF' | cat - "${file}" > "${file}.bom" && mv "${file}.bom" "${file}"
				echo "$TYPE, converted to UTF-8(with BOM)"
			else
				if echo "$TYPE" | grep -q 'UTF-8 Unicode'
				then
					printf '\xEF\xBB\xBF' | cat - "${file}" > "${file}.bom" && mv "${file}.bom" "${file}"
					echo "$TYPE, converted to UTF-8(with BOM)"
				else
					echo "$TYPE, Not converted."
				fi
			fi
		fi
	fi
done

