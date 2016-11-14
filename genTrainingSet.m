function [ X,Y ] = genTrainingSet(num_examples, positive)
%GENTRAININGSET Generate a training set of corsses
    %
    % num_example : number of training examples
    % pos : positive/negative (i.e., crosses or random pictures)

    MIN_VAL = -1;
    MAX_VAL = 1;    

    size = 9;
    background = ones(size,size)*MIN_VAL;   % Init black background
    
    X = {};
    Y = {};
    
    % generate crosses
    for i=1:num_examples
        
        pic = background;      
        
        if positive
            len = randi([5 size]);
            x = randi([1 size-len+1]);
            y = randi([1 size-len+1]);       
            j = 0;        
            while j<len %&& x<=size && y<=size
                k = x+j;
                h = x+len-j-1;
                pic(k,k) = MAX_VAL;
                pic(k,h) = MAX_VAL;
                j = j+1;            
            end
            Y{end+1} = 1;
        else    
            % Generate random pictures
            num_rnd_px = randi([1 5]);
            for j=1:num_rnd_px
                pic(randi([1 9]),randi([1 9])) = MAX_VAL;
            end
            Y{end+1} = 0;      
        end        
        X{end+1} = pic;
    end    
end

