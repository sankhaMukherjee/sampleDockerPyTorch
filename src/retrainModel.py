import numpy as np 
import torch, os

def main():

    X = np.load('data/X.npy').astype(np.float32)
    y = np.load('data/y.npy').astype(np.float32)

    X = torch.from_numpy( X )
    y = torch.from_numpy( y )

    model = torch.load( 'models/mainModel.pth' )
    loss = model.fit(X, y, N=10, printEvery=1)
    print(loss)
    print(f'Trained model: {model}')

    model.saveModel(folder='models/retrainedModel')


    return 

if __name__ == "__main__":
    main()
