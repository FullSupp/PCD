function [ countR countG countB ] = histogram( img )
gR = uint8(zeros(size(img,1),size(img,2)));
gG = gR;
gB = gR;
% size(grey)
countR = zeros(1,256);
countG = zeros(1,256);
countB = zeros(1,256);
for i = 1:size(img,1);
    for j = 1:size(img,2);
        gR(i,j) = img(i,j,1);
        gG(i,j) = img(i,j,2);
        gB(i,j) = img(i,j,3);
    end
end

for i = 1:size(img,1);
    for j = 1:size(img,2);
        countR(gR(i,j)+1) = countR(gR(i,j)+1) + 1;
        countG(gG(i,j)+1) = countG(gG(i,j)+1) + 1;
        countB(gB(i,j)+1) = countB(gB(i,j)+1) + 1;
    end
end
end

