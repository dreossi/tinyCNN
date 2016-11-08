function [ pic ] = reLu( pic )
%RELU Rectified linear unit
    pic = max(pic,0);
end

