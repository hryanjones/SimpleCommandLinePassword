#! /bin/bash

echo "$*"

for FILE in $*; do
	echo "gpg -e -r 'H. Ryan Jones' ${FILE}"
	echo "ls ${FILE}.gpg && shred -u ${FILE}"
done
