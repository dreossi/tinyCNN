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

