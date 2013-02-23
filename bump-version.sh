#!/bin/bash

DATE=$(date -u +%Y%m%d)
FILE=app/aboot/aboot.c

OLDVERSION=$(grep lkversion ${FILE} | sed 's/[^0-9]*//g')

if [ ${DATE} -gt ${OLDVERSION} ] ; then
	echo "Bumping Version to ${DATE}"
	sed -i s/${OLDVERSION}/${DATE}/g ${FILE}
	echo "Committing"
	git add $FILE
	git commit -m "bump version to ${DATE}"
else
	echo "Back to the future"
fi
