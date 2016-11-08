% generate a centered X

size = 9;

pic = ones(9,9)*(-1);   % Init black background

for i=2:8
    pic(i,i) = 1;
    pic(size+1-i,i) = 1;
end

filterLdiag = ones(3,3)*-1;
filterLdiag(1,1) = 1;
filterLdiag(2,2) = 1;
filterLdiag(3,3) = 1;

filterRdiag = ones(3,3)*-1;
filterRdiag(1,3) = 1;
filterRdiag(2,2) = 1;
filterRdiag(3,1) = 1;

filterCross = ones(3,3)*-1;
filterCross(1,1) = 1;
filterCross(1,3) = 1;
filterCross(2,2) = 1;
filterCross(3,1) = 1;
filterCross(3,3) = 1;

figure(10)
imshow(imresize(pic,3));


conv1 = convolve(pic,filterLdiag);

figure(1)
imshow(imresize(conv1,3));

reul_conv1 = pooling(conv1);

figure(2)
imshow(reul_conv1);

figure(3)
B = imresize(reul_conv1,3);
imshow(B)
