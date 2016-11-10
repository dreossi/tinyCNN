function [ w ] = backpropagation( x,yp, w, filters,iters )
    % Apply backpropagation to the CNN
    %
    % x : training set
    % yp : expected outcomes
    % w : initial weights
    % iters : total number of iterations
    %
    % w : learnt weights
    

    for i=1:iters        
        for j=1:length(x)
            % get current classification
            [y,h] = classify(x{j},w,filters);
            % apply a backprop step
            w = backwardStep(h,y,yp{j},w);
            y
        end
    end
end

