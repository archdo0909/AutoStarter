#!/bin/bash

# generate jupyter notebook config python file

pushd "/home/modi" && jupyter notebook --generate-config

if [ ! -d .jupyter ]; then
	mv "/root/.jupyter" "/home/modi" 
fi

popd
# find diff file
CURRENT_PATH="${PWD}/00-patches"
pushd ${CURRENT_PATH}
if [ -f jupyter_config.diff ]; then
    patch jupyter_config.diff
fi

popd
