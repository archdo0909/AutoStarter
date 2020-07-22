#!/bin/bash

pushd "/home/modi" && jupyter notebook --generate-config

if [ ! -d .jupyter ]; then
	mv "/root/.jupyter" "/home/modi" 
fi
popd
