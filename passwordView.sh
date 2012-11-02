#! /bin/bash

for FILE in $*; do
	echo "gpg -q -d ${FILE}; read -t 60; clear"
done
