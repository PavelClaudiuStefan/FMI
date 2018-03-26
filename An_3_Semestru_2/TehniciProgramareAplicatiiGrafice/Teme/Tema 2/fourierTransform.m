%clear all; close all; clc

img = imread('Ex1-Original.jpg');
figure(1); imshow(img); title('Original image');

img = rgb2gray(img);
figure(2); imshow(img); title('Gray image');

imgFft = fft2(img);
S = abs(imgFft);
%figure(3); imshow(S,[]); title('Fourier transform of an image');

imgFftShift = fftshift(imgFft);
%figure(4); imshow(abs(imgFftShift), []); title('centered fourier transform');

S2 = log(1+abs(imgFftShift));
figure(5); imshow(S2, []); title('log transformed image');

m=max(S2(:));
figure(8); imshow(im2uint8(S2/m)); title('test 1');
b=1./(1+(z./15).^2);


imgFft = ifftshift(imgFftShift);
img = ifft2(imgFft);
figure(6); imshow(img, []); title('reconstructed gray image');
