#!/bin/bash

if [ ! -d 'models' ]
then
    echo "the data folder doesnt exists. creating it first"
    mkdir data
fi 

if [ -f 'models/mainModel.pth' ]
then
    echo 'models/mainModel.pth already present'
    echo 'deleting this file'
    rm models/mainModel.pth
fi 

aws s3 cp "s3://sankha-test-models-folder/$model" models/mainModel.pth
