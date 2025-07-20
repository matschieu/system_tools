#!/bin/bash

PRF_FILE='/home/mathieu/.unison/phone.prf'
DEST='/media/mathieu/Data/Mathieu/Téléphone/Galaxy A3 2017/'
GVFS='/run/user/1000/gvfs/'

function append_phone_prf() {
	echo $1 >> $PRF_FILE;
}

cd $GVFS
MTP=`ls` 

if [[ -z "$MTP" ]]; then
	echo "No phone found"
	exit 1
fi

echo "BEFORE CONTINUING, AUTORISE THE COMPUTER TO READ THE PHONE MEMORY"
read

SRC="$GVFS$MTP/Card"

touch $PRF_FILE
cp -f $PRF_FILE ${PRF_FILE}.save
rm $PRF_FILE

append_phone_prf "# $PRF_FILE"
append_phone_prf "# Unison preferences file"
append_phone_prf "root = $SRC"
append_phone_prf "root = $DEST"
append_phone_prf "ignore = Path DCIM Galaxy A3"
append_phone_prf "ignore = Path LOST.DIR"
append_phone_prf "ignore = Path Android"
append_phone_prf "perms = 0"
append_phone_prf "times = true"

CMD="unison phone -force $SRC -auto"

echo $CMD
cat $PRF_FILE

$CMD

