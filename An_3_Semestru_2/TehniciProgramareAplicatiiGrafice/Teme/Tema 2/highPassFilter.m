img = imread('Ex2-Original.png');
figure(1); imshow(img); title('Original image');

img = rgb2gray(img);
figure(2); imshow(img); title('Gray image');

[x,y] = meshgrid(-256:255, -256:255);
z = sqrt(x.^2 + y.^2);
c = z > 15;

imgfftshift = fftshift(fft2(img));
fftShow(imgfftshift, 3);

procimg = imgfftshift.*c;

fftShow(procimg, 4);

invimg = ifft2(procimg);
ifftShow(invimg, 5);
