function [I] = rotate90(img)
%ROTATE90 Summary of this function goes here
%   Detailed explanation goes here
x = size(img);
I = zeros(x(2), x(1), 3);
b = 1;
a = 1;
for i = 1:x(1)
    for j = x(2):-1:1
        I(a,b,:) = img(i,j,:);
        a = a+1;
    end
    a = 1;
    b = b+1;
end
I = uint8(I);
end

