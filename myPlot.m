function [ ] = myPlot( pic )
    % MYPLOT plot the pictures

    scale = 20;
    MAX_VAL = 63;
    
    cmp = colormap;
    
    m = min(min(pic));
    M = max(max(pic));
    
    a = 1/(M-m);
    b = -m/(M-m);
    
    pic = (pic*a + b)*MAX_VAL;
    
    imshow(scaleUp(pic,scale),cmp);    
    drawnow;

end

