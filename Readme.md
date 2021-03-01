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
