function [ I ] = rotate270( img )
%ROTATE270 Summary of this function goes here
%   Detailed explanation goes here
x = size(img);
I = zeros(x(2), x(1), 3);
l = x(1);
for i = 1:x(1)
    for j = 1:x(2)
        I(j,l,:) = img(i,j,:);
    end
    l = l-1;
end
I = uint8(I);

end

