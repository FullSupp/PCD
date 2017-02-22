function [ Image ] = erosi( img )
Image = imerode(im2bw(img),ones(3));
end

