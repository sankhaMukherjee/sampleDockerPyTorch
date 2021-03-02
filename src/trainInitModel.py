from lib import simpleModel
import numpy as np 
import torch, os

def main():

    X = np.load('data/X.npy').astype(np.float32)
    y = np.load('data/y.npy').astype(np.float32)

    X = torch.from_numpy( X )
    y = torch.from_numpy( y )

    model = simpleModel.Model(M=2, modelID='someID')
    loss = model.fit(X, y, N=1000, printEvery=20)
    print(loss)

    model.saveModel(folder='models/testModel')


    return 

if __name__ == "__main__":
    main()
