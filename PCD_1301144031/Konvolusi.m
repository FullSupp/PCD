function [ image ] = Konvolusi(img)
image = zeros(size(img,1),size(img,2),size(img,3));
[a b c]= size(img);
mask = [1 2 1;
        0 0 0;
        -1 -2 -1;];
% mask = randint(3,3,[-1 3]);
for k=1:c;
    for i =2:a-2;
        for j = 2:b-2;
            image(i,j,k) = img(i-1,j-1,k)* mask(1,1) + img(i-1,j,k) * mask(1,2) + img(i-1,j+1,k)* mask(1,3) + img(i,j-1,k) * mask(2,1) + img(i,j,k) * mask(2,2) + img(1,j+1,k) * mask(2,3) + img(i+1, j-1,k) * mask(3,1) + img(i+1, j,k) * mask(3,2) + img(i+1, j+1,k) * mask(3,3);
        end
    end
end
image = uint8(image);
end