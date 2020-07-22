#!/bin/bash

# generate jupyter notebook config python file

pushd "/home/modi" && jupyter notebook --generate-config

if [ ! -d .jupyter ]; then
	mv "/root/.jupyter" "/home/modi"
        sudo chmod -R +rx /home/modi/.jupyter 	
fi

popd
# find diff file
CURRENT_PATH="${PWD}/00-patches"
pushd ${CURRENT_PATH}
if [ -f jupyter_config.diff ]; then
    patch -d/ -p0 < jupyter_config.diff
fi

cp -rf /usr/src/wificonnection/wificonnection /home/modi/.local/lib/python3.7/site-packages
jupyter serverextension enable --py wificonnection --user
jupyter nbextension install --py wificonnection --user
jupyter nbextension enable --py wificonnection --user
popd
