function [ Image ] = Flip_Vertical( img )
Image = zeros(size(img));
[a b c] = size(Image);
vertical = a;
for i=1:a;
    for j=1:b;
        Image(i,j,:) = img(vertical,j,:);
    end
    vertical=vertical -1;
end
Image = uint8(Image);

end

