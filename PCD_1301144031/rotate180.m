function [I] = rotate180(img)
%ROTATE180 Summary of this function goes here
%   Detailed explanation goes here
x = size(img);
I = zeros(x(1),x(2),3);
l = x(1);
% a = 1;
for i = 1:x(1)
    for j = 1:x(2)
        I(l,j,:) = img(i,j,:);
    end
    l = l-1;
end

I = uint8(I);
end

