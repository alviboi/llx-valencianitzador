#!/bin/sh
FILE=`zenity --file-selection --title="selecciona arxiu a traduïr"`
case $? in
         1)
                exit;;
        -1)
                exit;;
esac

FILEDESTI=`zenity --file-selection --save --filename="ca@valencia.po" --title="selecciona arxiu a guardar"`
case $? in
         1)
                exit;;
        -1)
                exit;;
esac


./src2valencia.sed < $FILE > $FILEDESTI

