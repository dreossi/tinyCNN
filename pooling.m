function [ pooled_x ] = pooling( x )
%POOLING max pooling
    %
    % x : matrix to be pooled
    %
    % x : pooled matix

    % Pool sizes
    POOL_N = 2;
    POOL_M = 2;

    [n,m] = size(x);
    np = fix(n/POOL_N);
    mp = fix(m/POOL_M);
    
    pooled_x = zeros(np,mp);
    
    for i=1:np
        for j=1:mp
            pooled_x(i,j) = max(max(x(i*POOL_N-1:(i*POOL_N),j*POOL_M-1:(j*POOL_M))));
        end
    end
    
    pooled_x = [ pooled_x zeros(np,1)];
    pooled_x = [ pooled_x ; zeros(1,mp+1)];
    
    
    % Treat special cases    
    % right edge
    for i=1:np
        pooled_x(i,end) = max(x(i*POOL_N-1:(i*POOL_N),end));
    end
    
    % lower edge
    for i=1:mp
        pooled_x(end,i) = max(x(end,i*POOL_M-1:(i*POOL_M)));
    end
    
    % lower corner
    pooled_x(end,end) = x(end,end);

end

