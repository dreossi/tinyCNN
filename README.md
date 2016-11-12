# tinyCNN
A tiny MATLAB convolutional neural network

## Description

The network can be composed by the following layers:
* convolution
* pooling (max)
*  normalization (relu)
* fully connected 

Weights are learned using backpropagation

## Demos

* `X_model.mat` contains the weights learned on a training set of 20 examples and 300 backpropagation iterations
* `classify.m` implements a 10-layers network trained to recognize crosses in 9x9 pictures
* `demo_class.m` shows how to classify pictures
* `demo_train.m` shows how to train the network via backpropagation
* `plotCNN.m` displays the layers that compose the network (see figure below)

![alt text](https://github.com/tommasodreossi/tinyCNN/blob/master/plotCNN.png "plotCNN")

