function [ Image ] = Flip_Horizontal( img)
Image = zeros(size(img));
[a b c] = size(Image);
horizon = b;
max = horizon;
for i=1:a;
    for j=1:b;
        Image(i,j,:) = img(i,horizon,:);
        horizon = horizon-1;
    end
    horizon=max;
end
Image = uint8(Image);
end

