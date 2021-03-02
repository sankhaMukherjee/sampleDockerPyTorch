FROM python:3.8
WORKDIR /code

# Create the folders
RUN mkdir bin
RUN mkdir data
RUN mkdir models
RUN mkdir src
RUN mkdir src/lib

# Copy the required stuff
# Remember that there are a number of things that you
# dont want to copy, especially the files related to
# 
COPY requirements.txt       requirements.txt
COPY bin/*                  ./bin/*
COPY src/lib/simpleModel.py ./src/lib/simpleModel.py
COPY src/retrainModel.py    ./src/retrainModel.py 
COPY src/trainInitModel.py  ./src/trainInitModel.py 
COPY src/welcome.py         ./src/welcome.py

# Install components
RUN pip3 install --upgrade pip 
RUN pip3 install -r requirements.txt 

CMD ['python3' 'src/welcome.py']
