close all
clear 
clc

dim = 1024;
xVect = 1:dim;
yVect = 1:dim;
[X,Y] = meshgrid(xVect,yVect);

image = zeros(dim,dim,60);


for ind = 1:60
    temp1 = 1 - uint8(mod(sqrt((X - 128).^2 + (Y - 128).^2), ind));
    temp2 = 1 - uint8(mod(sqrt((X - 384).^2 + (Y - 384).^2), ind));
    image(:,:,ind) = bitxor(temp1,temp2);
end

implay(image(:,:,2:end),30);
