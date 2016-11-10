function [ relu_x ] = reLuLayer( x )
%RELULAYER rectified linear unit layer
    %
    % x : matrices to be normalized
    %
    % relu_x : normalized matrices

    for i=1:length(x)
        relu_x{i} = reLu(x{i});
    end
end

