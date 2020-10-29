%Clearing memory and command window
clc;clear all;close all;

%Getting Input
INPUT = 'lena.bmp';
in_img = imread(INPUT);
% imshow(in_img);title('Input Image');

%Halftone Image Conversion
dst = EDBS(in_img);
% figure;imshow(halftone_img);title('Floyd Halftoned Image');
% imwrite(halftone_img,'lena_halftone.bmp');

figure;
subplot(121);
imshow(in_img);title('Input Image');
subplot(122);
imshow(dst);title('Direct binary search halftone');
imwrite(dst,'Direct binary search halftone.bmp');