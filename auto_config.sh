#!/bin/bash -e

# Excute as sudoer
if ! [ $(id -u) = 0 ]; then
   echo "The script need to be run as root." >&2
   exit 1
fi

if [ $SUDO_USER ]; then
    real_user=$SUDO_USER
else
    real_user=$(whoami)
fi

# Set current folder
export CONFIG_HOME_DIR=${PWD}
echo "${CONFIG_HOME_DIR}"

SET=$(seq -f "%02g" 0 10)
# Extract target folder

for file in ${CONFIG_HOME_DIR}/*; do 
    if [ -d "${file}" ]; then

        pushd "${file}" > /dev/null

        if [ -f SKIP ]; then
            popd
        
        elif [ ! -f SKIP ]; then
            echo "there is no SKIP"
            #for i in $SET; do
            for i in $SET; do
                if [ -f "${i}-setup.sh" ]; then
                    echo "start setup.sh"
                    ./${i}-setup.sh
                fi
            done
            touch SKIP
            popd
        fi
    fi
done

# Check installed flag


# Create installed flag

