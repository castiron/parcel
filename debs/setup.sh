#!/bin/bash
# Author: clark@castironcoding.com
# Purpose: setup .deb symlinks on each deployment

current_dir=$( cd "../$( dirname "${BASH_SOURCE[0]}" )" && pwd )

for i in $( find ${current_dir}/src -type f -name *.deb)
do
    fullpath=${i}
    filename="${fullpath##*/}"
    ln -s ${fullpath} ${current_dir}/debs/amd64/${filename}
done

exit 0;