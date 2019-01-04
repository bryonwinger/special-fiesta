#!/bin/bash
STAGE=$1

if [[ -n $STAGE ]]; then
    echo "Deploying to $STAGE..."
    exit 0
else
    echo 'You must specify a stage!'
    exit 1
fi
