function [ scaled_pic ] = scaleUp( pic, scale )
%SCALEUP zoom in a picture
    %
    % pic : picture to be scaled
    % scale : scaling factor
    %
    % scaled_pic : the scaled picture
    %    

    [n,m] = size(pic);
    
    ns = n*scale;
    ms = m*scale;
    
    scaled_pic = zeros(ns,ms);
    
    for i=1:n
        for j=1:m
            
            k_start = (i-1)*scale+1;
            h_start = (j-1)*scale+1;
            
            for k=k_start:(k_start+scale-1)
                for h=h_start:(h_start+scale-1)
                    scaled_pic(k,h) = pic(i,j);
                end
            end            
        end
    end

end

