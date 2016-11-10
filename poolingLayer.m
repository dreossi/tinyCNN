function [ pooled_x ] = poolingLayer( x )
%POOLINGLAYER apply pooling to all the matrices
    %
    % x : collection of matrices 
    %
    % pooled_x : pooled matrices        

    for i=1:length(x)
        pooled_x{i} = pooling(x{i});
    end

end

