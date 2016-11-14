function [ fil_x ] = convolutionLayer( x, filters )
%CONVOLUTIONLAYER apply convolution to all elements of x

    fil_x = {};
    for i=1:length(x)
        for j=1:length(filters)
            fil_x{end+1} = convolve(x{i},filters{j});
        end
    end
    
end

function [ conv_pic ] = convolve( x, filter )
%CONVOLVE convolve x with filter
    %
    % x : the matrix to be convolved
    % filter : filter to be applied
    %
    % conv_x : convolved x

    [n,m] = size(x);
    [nf,mf] = size(filter);
    
    conv_pic = zeros(n,m);    
    
    for i=1:n-nf+1
        for j=1:m-mf+1
            conv_pic(i+1,j+1) = applyFilter(x(i:i+nf-1,j:j+mf-1),filter);
        end
    end
    
    % Treat special cases (where filter exists the picture)    
    % four corners
    conv_pic(1,1) = applyFilter(x(1:2,1:2),filter(2:3,2:3));
    conv_pic(1,m) = applyFilter(x(1:2,m-1:m),filter(2:3,1:2));
    conv_pic(n,1) = applyFilter(x(n-1:n,1:2),filter(1:2,2:3));
    conv_pic(n,m) = applyFilter(x(n-1:n,m-1:m),filter(1:2,1:2));
    
    % upper edge
    for i=1:m-2
        conv_pic(1,i+1) = applyFilter(x(1:2,i:i+mf-1),filter(2:nf,1:mf));
    end
    % lower edge
    for i=1:m-2
        conv_pic(n,i+1) = applyFilter(x(n-1:n,i:i+mf-1),filter(1:2,1:mf));
    end
    % left edge
    for i=1:n-2        
        conv_pic(i+1,1) = applyFilter(x(i:i+2,1:2),filter(1:nf,2:3));
    end
    % right edge
    for i=1:n-2        
        conv_pic(i+1,m) = applyFilter(x(i:i+2,m-1:m),filter(1:nf,1:2));
    end

end

function [ fil_pix ] = applyFilter( pic, filter  )
%APPLY_FILTER Apply the filter to a picture
    %
    % pic : the picture
    % filter : the filter
    %
    % fil_pix : filtered picture

    [n,m] = size(pic);
    sum = 0;

    for i=1:n
        for j=1:m
            sum = sum + pic(i,j)*filter(i,j);
        end
    end
    
    fil_pix = sum/(n*m);

end




