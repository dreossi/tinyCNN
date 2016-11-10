function [ y, neurons ] = fullyConnectedLayer( x, w )
%FULLYCONNECTEDLAYER fully connected layer
    %
    % x : values of hidden layer
    % w : weights
    %
    % y : predicted valu

    neurons = [];

    % stack matrices in a unique vector
    for i=1:length(x)
        pic = x{i};
        for j=1:size(pic,1)
            for k=1:size(pic,2)
                neurons(end+1) = pic(j,k);
            end
        end
    end
    
    % compute activation value
    for i=1:length(w)
        param = w{i};
        wsum = 0;
        for j=1:length(param)
           wsum = wsum +  param(j)*neurons(j);
        end
        %labels(i) = wsum/sum(param);       
        y(i) = 1/(1+exp(-sum(wsum)));
    end
end

