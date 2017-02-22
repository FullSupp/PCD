function [magnitude] = BW(img)
mask1 = [-1 -1 -1;
        1 -2 1;
        1 1 1;];
mask2 = [1 -1 -1;
        1 -2 -1;
        1 1 1;];
mask3 = [1 1 -1;
        1 -2 -1;
        1 1 -1;];
mask4 = [1 1 1;
        1 -2 -1;
        1 -1 -1;];
mask5 = [1 1 1;
        1 -2 1;
        -1 -1 -1;];
mask6 = [1 1 1;
        -1 -2 1;
        -1 -1 1;];
mask7 = [-1 1 1;
        -1 -2 1;
        -1 1 1;];
mask8 = [-1 -1 1;
        -1 -2 1;
        1 1 1;];
    
img = rgb2gray(img);
img = double(img);
B1 = conv2(img,mask1,'same');
B2 = conv2(img,mask2,'same');
B3 = conv2(img,mask3,'same');
B4 = conv2(img,mask4,'same');
B5 = conv2(img,mask5,'same');
B6 = conv2(img,mask6,'same');
B7 = conv2(img,mask7,'same');
B8 = conv2(img,mask8,'same');
magnitude = sqrt(B1.^2+B2.^2+B3.^2+B4.^2+B5.^2+B6.^2+B7.^2+B8.^2);
thresh = magnitude < 45;
magnitude(thresh) = 0;
end

