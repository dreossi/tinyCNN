function [ fil_x ] = convolutionLayer( x, filters )
%CONVOLUTIONLAYER apply convolution to all elements of x

    for i=1:length(filters)
        fil_x{i} = convolve(x{i},filters{i});
    end
    
end

