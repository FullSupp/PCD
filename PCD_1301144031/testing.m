clc; cla;

A = imread('pas foto.jpg');
A = rgb2gray(A);
length = 4;
orientation = 0;
[mag, phase] =  imgaborfilt(A,length,orientation);
figure
subplot(1,3,1);
imshow(A);
title('Original Image');
subplot(1,3,2);
imshow(mag,[])
title('Gabor magnitude');
subplot(1,3,3);
imshow(phase,[]);
title('Gabor phase');