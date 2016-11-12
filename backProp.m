function [ w, errs ] = backProp( x,yp, w, filters,iters )
    % Apply backpropagation to the CNN
    %
    % x : training set
    % yp : expected outcomes
    % w : initial weights
    % iters : total number of iterations
    %
    % w : learnt weights
    
    errs = zeros(iters*length(x));       
    for i=1:iters 
        for j=1:length(x)
            % get current classification
            [y,cnn] = classify(x{j},w,filters);
            % apply a backprop step
            [w,err] = backPropStep(cnn{end}.stack,y,yp{j},w);
            errs((i-1)*length(x) + j) = err;            
        end
    end
end

function [ wp, err ] = backPropStep( x,y,yp,w )
%BACKWARDSTEP Sincle backpropagation step
    % x : training data
    % y : predicted output
    % yp : expected output
    % w : actual weights
    %
    % wp : learnt weights
    %    
    
    ALPHA = 1000;   % Learning rate
    
    err = error(yp,y)
    wsum = dot(x,w);    
    
    % Gradient ascent on wieghts
    for i=1:length(w)
        wp(i) = w(i) + ALPHA*err*dg(wsum)*x(i);
    end
    
end

% Error between current and expected value
function err = error(x,xp)
    err = 0;
    for i=1:size(x)
        err = err + ((x(i) - xp(i))^2)/2;
    end
end

% First derivative of activation function
function dgx = dg(x)
    dgx = g(x)*(1-g(x));
end

% Activation function (sigmoid)
function gx = g(x)
    gx = 1/(1+exp(-x));    
end


