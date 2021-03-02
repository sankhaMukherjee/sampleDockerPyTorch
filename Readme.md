# 1. sampleDockerPyTorch

This is a simple example that will be used to construct a project
that can be used as a template for creating a simple dockerized
project.


# 2. External Data and Models

In this simple example, there is only a single location for the models
and the data. This will be different for your own Kubeflow projects wherein
the data and models will come from a library containing the data and the
models. This will be dealt with at the Kubeflow level, through the use of
environment variables, and configuration files. Thisis detailed in the next
Section.

## 2.1. Location of the data

The data is available in an online location in an S3 bucket. The details
of creating this random data is present within this 
[Jupyter Notebook](https://github.com/sankhaMukherjee/sampleDockerPyTorch/blob/master/Notebooks/Create%20some%20random%20data.ipynb).

The data is present in the bucket `s3://sankha-test-data-folder` as files

 - `s3://sankha-test-data-folder\X.npy`
 - `s3://sankha-test-data-folder\y.npy`

### 2.1.1. Downloading the data

The following command 
    
`dataSource='sankha-test-data-folder' bin/dataDownload.sh`

can be used to download the data from the designated S3 bucket. This is directly
downloaded into the data folder. If the folder does not exist, this folder will
be created first, before the data is downloaded. This can later be used by `kubectl`
to download the data into a node before starting a new training run.

## 2.2. Location of the models

The models are available in an online location in an S3 bucket. The base location
of the model files are present within the bucket `s3://sankha-test-models-folder`,
and is organized into smaller folders, with folder-ids that match the id's of a 
specific model.

A saved model is an entire application that has, at a minimum, the following
methods:

 - `model.fit(X, y, N=100)`
 - `model.predict(X)`
 - `model.saveParams(folder)`
 - `model.loadParams(folder)`
 - `model.saveModel(folder)`

Hence, the model is expected to contain the optimizer and everything else that is
necessary to solve the problem. 


### 2.2.1. Training a simple model

An example of how a simple model can be trained is shown in the file `src/trainInitModel.py`.
This function trains the model that is defined within the file `src\lib\simpleModel.py`. This
file defined a class `Model()` that contains all the methods described in Section 2.2., and can
be used for training a set of models based upon the data provided to it. 

`python3 src/trainInitModel.py`

The result is as follows:

```sh
$ python3 src/trainInitModelpy
loss = 7.230027198791504
loss = 1.1745001077651978
loss = 0.316214919090271
loss = 0.2415977120399475
loss = 0.19955676794052124
... <-- some missing values here
loss = 2.3827268283427294e-12
loss = 1.936336724642218e-12
loss = 1.7655173113403921e-12
[7.23002720e+00 7.12352324e+00 7.01786709e+00 ... 1.51600932e-12
 1.51600932e-12 1.51600932e-12]
Trained model: Model weights [someID]: w = [2.000e+00, 3.000e+00], b = [2.739e-06]
```

As can be seen, the model was able to find the weight vector (2,3) that the data was created with.
