function [ Image ] = Blurring( img )

Image = zeros(size(img));
mask = [1/9 1/9 1/9;
        1/9 1/9 1/9;
        1/9 1/9 1/9;];
[a b c] = size(Image);
for k=1:c;
    for i =2:a-2;
        for j = 2:b-2;
            Image(i,j,k) = img(i-1,j-1,k)* mask(1,1) + img(i-1,j,k) * mask(1,2) + img(i-1,j+1,k)* mask(1,3) + img(i,j-1,k) * mask(2,1) + img(i,j,k) * mask(2,2) + img(1,j+1,k) * mask(2,3) + img(i+1, j-1,k) * mask(3,1) + img(i+1, j,k) * mask(3,2) + img(i+1, j+1,k) * mask(3,3);
        end
    end
end
Image = uint8(Image);
end

