% DEMO_TRAINING
% This demo shows how to train the convolutional neural network implemented
% in classify.m
%


NUM_TRAIN_EX = 20;      % # of positive training examples
BACKPROP_ITERS = 500;   % # of backprop iterations
w0 = rand(27*9,1);      % initial random weights

% generate convolution filters and training set
filters = genFilters();
[x,y] = genTrainingSet(NUM_TRAIN_EX,1);

% train the network
[w,errs] = backProp(x,y,w0,filters,BACKPROP_ITERS);

% display error trand
%plot([1:length(errs),err]);