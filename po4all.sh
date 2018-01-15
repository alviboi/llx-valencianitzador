#!/bin/bash


function sanitize {

 # start with the original pattern
    escaped=$1

    # escape all backslashes first
    escaped="${escaped//\\/\\\\}"

    # escape slashes
    escaped="${escaped//\//\\/}"

    # escape asterisks
    escaped="${escaped//\*/\\*}"

    # escape full stops
    escaped="${escaped//./\\.}"    

    # escape [ and ]
    escaped="${escaped//\[/\\[}"
    escaped="${escaped//\[/\\]}"

    # escape ^ and $
    escaped="${escaped//^/\\^}"
    escaped="${escaped//\$/\\\$}"

    # remove newlines
    escaped="${escaped//[$'\n']/}"


}

if [ $# -ne 2  ];
then
    echo -e "\nNecessite 2 paràmetres"
    echo -e "\n\tpo4all.sh carpetaOrigen carpetaDesti\n"
    exit -1
    
fi

sanitize $1
path_origin=$escaped

sanitize $2
path_dest=$escaped

total_chains=0
total_fuzzy=0

for i in `find $1 -name *.po`;
do
    newfile=`echo $i | sed "s/${path_origin}/${path_dest}/g"`
    newdir=`dirname ${newfile}`
    [ -d ${newdir} ] || mkdir -p ${newdir}
   
    # Let's go!
    echo "Fitxer: ${newfile}..."
    ./src2valencia.sed < ${i} > ${newfile}

    # Mark fuzzy chains
    ./po-fuzzy-from-catalan-silent.py ${newfile} ${i}
    
    # Getting statistics
    chains=`potool ${newfile} -s 2>/dev/null`
    echo "cadenes: $chains"
    [ $chains ] || chains=0


    fuzzy=`potool ${newfile} -ff -s 2>/dev/null`
    echo "fuzzy: $fuzzy"
    [ $fuzzy ] || fuzzy=0


    total_chains=$((${total_chains}+${chains}))
    total_fuzzy=$((${total_fuzzy}+${fuzzy}))
      
done

percent=$((${total_fuzzy}*100/${total_chains}))
echo -e "Finalitzat!\n"
echo -e "Cadenes totals: ${total_chains}"
echo -e "Cadenes fuzzy: ${total_fuzzy} (${percent})%"

exit 0
