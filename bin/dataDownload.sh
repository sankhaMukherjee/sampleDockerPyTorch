#!/bin/bash

if [ ! -d 'data' ]
then
    echo "the data folder doesnt exists. creating it first"
    mkdir data
fi 

aws s3 cp "s3://$dataSource/" data/ --recursive
