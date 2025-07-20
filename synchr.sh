#!/bin/bash

TARGET=`dirname "$(realpath $0)"`
TARGET=$TARGET/home

# Files synchronisation
for FILE in ".bashrc" ".vimrc"; do
	SUBTARGET=`dirname $FILE`
	echo Copying file $FILE into $TARGET/$SUBTARGET
	mkdir -p $TARGET/$SUBTARGET && cp ~/$FILE $TARGET/$SUBTARGET
done

# Folders synchronisation
for DIR in "scripts" ".local/share/applications"; do
	echo Copying folder $DIR into $TARGET/$DIR
	mkdir -p $TARGET/$DIR && cp ~/$DIR/* $TARGET/$DIR
done

