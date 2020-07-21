#!/bin/bash

# Set current folder
export CONFIG_HOME_DIR=${PWD}
echo "${CONFIG_HOME_DIR}"
# Extract target folder

for file in ${CONFIG_HOME_DIR}/*; do 
    if [ -d "${file}" ]; then

        echo "found"
        pushd "${file}" > /dev/null

        if [ -f SKIP ]; then
            echo "SKIP"
            popd
        fi
    fi
done

# Check installed flag


# Create installed flag

