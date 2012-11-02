#! /bin/bash

# This is just a small script to automate the decrypt, edit and re-encrypt process for my passwords file to try and eliminate the possibility of me screwing it up on accident
# TO DO
# Make a remote backup as well (start scripting this in with boto I think

ENCRYPTED="$1"
DECRYPTED=`echo $ENCRYPTED | sed -e 's/\.gpg$//'`

# first make a quick local backup of passwords file (better to also make a non local backup for redundancy)
cp ${ENCRYPTED} ${ENCRYPTED}~

echo "#first decrypting ${ENCRYPTED} to normal flat file"
echo -e "\tgpg -d ${ENCRYPTED} > ${DECRYPTED}"

echo "#next opening vim to edit file"
echo -e "\tvim ${DECRYPTED}"
echo "-----------Stop Copying Here-----------"

echo "#delete orig file and re-encrypt"
echo -e "\trm -f ${ENCRYPTED}"
echo -e "\tgpg -e -r 'H. Ryan Jones' ${DECRYPTED}"

echo "#shred ${DECRYPTED} and accompanying \~ file"
echo -e "\tshred -u ${DECRYPTED}"
echo -e "\tshred -u ${DECRYPTED}~"
