clc;clear all;close all;
input=imread('lena.bmp');
J=dct2(input);
figure
imshow(log(abs(J)),[])
colormap(gca,jet(64))
colorbar