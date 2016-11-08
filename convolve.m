function [ conv_pic ] = convolve( pic, filter )
%CONVOLVE 

    [n,m] = size(pic);
    [nf,mf] = size(filter);
    
    conv_pic = zeros(n,m);    
    
    for i=1:n-nf+1
        for j=1:m-mf+1
            conv_pic(i+1,j+1) = apply_filter(pic(i:i+nf-1,j:j+mf-1),filter);
        end
    end
    
    % four corners
    conv_pic(1,1) = apply_filter(pic(1:2,1:2),filter(2:3,2:3));
    conv_pic(1,m) = apply_filter(pic(1:2,m-1:m),filter(2:3,1:2));
    conv_pic(n,1) = apply_filter(pic(n-1:n,1:2),filter(1:2,2:3));
    conv_pic(n,m) = apply_filter(pic(n-1:n,m-1:m),filter(1:2,1:2));
    
    % upper edge
    for i=1:m-2
        conv_pic(1,i+1) = apply_filter(pic(1:2,i:i+mf-1),filter(2:nf,1:mf));
    end
    % lower edge
    for i=1:m-2
        conv_pic(n,i+1) = apply_filter(pic(n-1:n,i:i+mf-1),filter(1:2,1:mf));
    end
    % left edge
    for i=1:n-2        
        conv_pic(i+1,1) = apply_filter(pic(i:i+2,1:2),filter(1:nf,2:3));
    end
    % right edge
    for i=1:n-2        
        conv_pic(i+1,m) = apply_filter(pic(i:i+2,m-1:m),filter(1:nf,1:2));
    end

end

