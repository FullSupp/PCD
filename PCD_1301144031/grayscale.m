function [ grey ] = grayscale( img )
grey = zeros(size(img,1),size(img,2));
grey = uint8(grey);
for i= 1:size(grey,1);
    for j= 1:size(grey,2);
        grey(i,j) = ((img(i,j,1))/3 + (img(i,j,2))/3 + (img(i,j,3))/3);
    end
end

end

