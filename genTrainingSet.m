function [ x,y ] = genTrainingSet()
%GENTRAININGSET Generate a training set of corsses

    MIN_VAL = -1;
    MAX_VAL = 1;    

    size = 9;
    background = ones(size,size)*MIN_VAL;   % Init black background
    
    % Centered X
    pic = background;
    for i=2:8
        pic(i,i) = MAX_VAL;
        pic(size+1-i,i) = MAX_VAL;
    end    
    x{1} = pic;
    y{1} = 1;
    
    % Up-left X
    pic = background;
    for i=1:7
        pic(i,i) = MAX_VAL;
        pic(i,8-i) = MAX_VAL;
    end
    x{2} = pic;
    y{2} = 1;
    
    % Tiny X
    pic = background;
    for i=4:6
        pic(i,i) = MAX_VAL;
        pic(size+1-i,i) = MAX_VAL;
    end
    x{3} = pic;
    y{3} = 1;
    
    % Square
    pic = background;
    pic(2,2:8) = MAX_VAL;
    pic(8,2:8) = MAX_VAL;
    pic(2:8,2) = MAX_VAL;
    pic(2:8,8) = MAX_VAL;
    x{4} = pic;
    y{4} = 0;
    
    % Random
    pic = background;
    for i=1:10
        pic(randi([1 9]),randi([1 9])) = MAX_VAL;
    end
    x{5} = pic;
    y{5} = 0;
    
%     % Low-right X
%     pic = background;
%     for i=9:-1:3
%         pic(i,i) = MAX_VAL;
%         pic(i,2+i) = MAX_VAL;
%     end
%     x{6} = pic;
%     y{6} = 0;
    
end

