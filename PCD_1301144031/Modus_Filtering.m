function [ Image ] = Modus_Filtering( img )
Image = zeros(size(img));
[a b c] = size(Image);
% img = int(img);
for k=1:c;
    for i =2:a-1;
        for j = 2:b-1;
            neighboor = [img(i-1,j-1,k)  img(i-1,j,k) img(i-1,j+1,k) ; 
            img(i,j-1,k)  img(i,j,k) img(1,j+1,k);
            img(i+1, j-1,k) img(i+1, j,k)  img(i+1, j+1,k);];
            [freq,number] = max(histc(neighboor(:),0:255));
            Image(i,j,k) = number;
        end
    end
end
Image = uint8(Image);
end

