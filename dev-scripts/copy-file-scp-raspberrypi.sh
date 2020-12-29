#!/bin/bash

HOST=${1?Error: No HOST given}
SOURCE_PATH=${2?Error: No SOURCE_PATH given}
DESTIONATION_PATH=${3?Error: No DESTIONATION_PATH given}

scp -r $HOST:$SOURCE_PATH $DESTIONATION_PATH
if [ $? -eq 0 ]; then
    echo 'Copy success!!'
else
    echo 'Copy failed!!'
fi