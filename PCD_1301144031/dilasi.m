function [ Image ] = dilasi( img )
Image = imdilate(im2bw(img),ones(3));
end

