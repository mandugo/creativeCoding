close all
clear 
clc

dim = 256;
startingImage = zeros(dim);
xVect = 1:dim;
yVect = 1:dim;

[X,Y] = meshgrid(xVect,yVect);

imageOne = 1 - mod(sqrt(X.*Y),42);
imageTwo = 1 - mod(bitxor(X,Y),42);
imageThree = 1 - abs(mod((X - 128)*64, (Y - 128)));
imageFour = 1 - mod(sqrt((X - 64).^2 + (Y - 64).^2), 42);


% imageRGB(:,:,1) = imageOne;
% imageRGB(:,:,2) = imageTwo;
% imageRGB(:,:,3) = imageFour;

imageRGB(:,:,1) = double(mod(bitxor(X,Y),27) == 3);
imageRGB(:,:,2) = double(mod(bitxor(X,Y),27) == 7);
imageRGB(:,:,3) = double(mod(bitxor(X,Y),27) == 5);

entropy(imageOne)
entropy(imageTwo)
entropy(imageThree)
entropy(imageFour)

figure(1)
subplot(2,2,1)
imshow(imageOne)
subplot(2,2,2)
imshow(imageTwo)
subplot(2,2,3)
imshow(imageThree)
subplot(2,2,4)
imshow(imageFour)

figure(2)
imagesc(imageRGB)
