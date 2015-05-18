#!/bin/bash
# Author: clark@castironcoding.com
# Purpose: setup .deb symlinks on each deployment

current_dir="/home/parcel/parcel/current"

for i in $( find ${current_dir}/src -type f -name *.deb)
do
    fullpath=${i}
    filename="${fullpath##*/}"
    ln -s ${fullpath} ${current_dir}/debs/amd64/${filename}
done

exit 0;