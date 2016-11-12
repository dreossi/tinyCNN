% DEMO_CLASS
% This demo shows how to the trained convolutional neural network (in classify.m) can be
% used to classify pictures containing crosses
%


% Load pretrained model (weights w)
load('X_model.mat');

% generate a cross and classify
[x,~] = genTrainingSet(1,1);
[score,cnn] = classify(x{1},w,filters);
fprintf('Score: %f\n',score);

% visualize cnn
figure(1)
plotCNN(cnn);

% generate a random picture and classify
[x,~] = genTrainingSet(1,0);
[score,cnn] = classify(x{1},w,filters);
fprintf('Score: %f\n',score);

%visualize cnn
figure(2)
plotCNN(cnn);

