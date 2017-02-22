function [ Image ] = Mean_Filtering( img )
Image = zeros(size(img));
[a b c] = size(Image);
for k=1:c;
    for i =2:a-1;
        for j = 2:b-1;
            Image(i,j,k) = mean2([img(i-1,j-1,k)  img(i-1,j,k) img(i-1,j+1,k) ; 
            img(i,j-1,k)  img(i,j,k) img(1,j+1,k);
            img(i+1, j-1,k) img(i+1, j,k)  img(i+1, j+1,k);]);
        end
    end
end
Image = uint8(Image);
end

