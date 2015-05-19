#!/bin/bash

if [ $# == 0 ]
then
	echo 'Requires name of package as argument.';
	exit 1;
else
	package=$1
fi

mkdir ${package}
cd ${package}

mkdir 'releases'
touch build.sh && chmod +x build.sh
touch README.md
echo "# ${package}" > README.md

exit 0;