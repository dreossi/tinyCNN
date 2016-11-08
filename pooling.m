function [ pooled_pic ] = pooling( pic )
%POOLING

    POOL_N = 2;
    POOL_M = 2;

    [n,m] = size(pic);
    np = fix(n/POOL_N);
    mp = fix(m/POOL_M);
    
    pooled_pic = zeros(np,mp);
    
    for i=1:np
        for j=1:mp
            pooled_pic(i,j) = max(max(pic(i*POOL_N-1:(i*POOL_N),j*POOL_M-1:(j*POOL_M))));
        end
    end
    
    pooled_pic = [ pooled_pic zeros(np,1)];
    pooled_pic = [ pooled_pic ; zeros(1,mp+1)];
    
    % right edge
    for i=1:np
        pooled_pic(i,end) = max(pic(i*POOL_N-1:(i*POOL_N),end));
    end
    
    % lower edge
    for i=1:mp
        pooled_pic(end,i) = max(pic(end,i*POOL_M-1:(i*POOL_M)));
    end
    
    % lower corner
    pooled_pic(end,end) = pic(end,end);

end

