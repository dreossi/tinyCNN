function [ fil_pix ] = apply_filter( pic, filter  )
%APPLY_FILTER Apply the filter to pic

    [n,m] = size(pic);
    sum = 0;

    for i=1:n
        for j=1:m
            sum = sum + pic(i,j)*filter(i,j);
        end
    end
    
    fil_pix = sum/(n*m);

end

