function [score,lay] = classify(x,w, filters)
% CLASSSIFY Implemenatation of a tiny CNN (10 Layers)
    %
    % x : picture to be classified
    % w : weights for fully connected layer
    % filters : filters for convolution
    %
    % score : conficence that x is a cross X
    % lay : snapshot of neurons of last layer

    lay{1} = x;
    lay{2} = x;
    lay{3} = x;
    
    SCALE = 20;
    NUM_LAYS = 10;
    
    plotLayer(lay,1,NUM_LAYS,SCALE,'input');
    
    lay = convolutionLayer(lay,filters);    
    plotLayer(lay,2,NUM_LAYS,SCALE,'conv');
    
    %yo = lay{1}
    
    lay = reLuLayer(lay);
    plotLayer(lay,3,NUM_LAYS,SCALE,'relu');
    
    lay = convolutionLayer(lay,filters);
    plotLayer(lay,4,NUM_LAYS,SCALE,'conv');
    
    lay = reLuLayer(lay);
    plotLayer(lay,5,NUM_LAYS,SCALE,'relu');
    
    lay = poolingLayer(lay);
    plotLayer(lay,6,NUM_LAYS,SCALE,'pool');
    
    lay = convolutionLayer(lay,filters);
    plotLayer(lay,7,NUM_LAYS,SCALE,'conv');
    
    lay = reLuLayer(lay);
    plotLayer(lay,8,NUM_LAYS,SCALE,'relu');
    
    lay = poolingLayer(lay);
    plotLayer(lay,9,NUM_LAYS,SCALE,'pool');

    weights{1} = w;
    [score,lay] = fullyConnectedLayer(lay,weights);
    plotLayer(lay,10,NUM_LAYS,SCALE,'fully');

    

end




