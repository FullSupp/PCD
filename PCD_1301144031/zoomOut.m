function [Y] = zoomOut(img)
%ZOOMOUT Summary of this function goes here
%   Detailed explanation goes here
Y = zeros(round(size(img,1)/2), round(size(img,2)/2),3);
m = 1; n=1;
for i = 1:size(Y,1)
    for j = 1:size(Y,2)
        Y(i,j,:) = img(m,n,:);
        n = round(n+2);
    end
    m = round(m+2);
    n = 1;
end
Y= uint8(Y);
end

