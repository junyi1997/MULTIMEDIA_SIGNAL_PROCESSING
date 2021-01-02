clc;clear all;close all;
n=2;
% a=[1 2 3 4;5 6 7 8;9 10 11 12;13 14 15 16;17 18 19 20; 21 22 23 24];
% a=[162,162,162,161,162,156,163,160;162,162,162,161,162,156,163,160;162,162,162,161,162,156,163,160;162,162,162,161,162,156,163,160;162,162,162,161,162,156,163,160;164,164,157,155,161,159,158,159;160,160,163,158,160,161,159,155;158,158,155,156,158,158,156,157]
a=imread('lena.bmp');
[A,B] = size(a);
for i=1:2:A
    for j=1:2:B
        %00
        Ans_DCT(i,j)=2/n*(2^-0.5)*(2^-0.5)*[a(i,j)*cos(0)*cos(0)+a(i,j+1)*cos(0)*cos(0)+a(i+1,j)*cos(0)*cos(0)+a(i+1,j+1)*cos(0)*cos(0)];
        %01
        Ans_DCT(i,j+1)=2/n*(2^-0.5)*1*[a(i,j)*cos(0)*cos(0.25*pi)+a(i,j+1)*cos(0)*cos(0.75*pi)+a(i+1,j)*cos(0)*cos(0.25*pi)+a(i+1,j+1)*cos(0)*cos(0.75*pi)];
        %10
        Ans_DCT(i+1,j)=2/n*1*(2^-0.5)*[a(i,j)*cos(0.25*pi)*cos(0)+a(i,j+1)*cos(0.25*pi)*cos(0)+a(i+1,j)*cos(0.75*pi)*cos(0)+a(i+1,j+1)*cos(0.75*pi)*cos(0)];
        %11
        Ans_DCT(i+1,j+1)=2/n*1*1*[a(i,j)*cos(0.25*pi)*cos(0.25*pi)+a(i,j+1)*cos(0.25*pi)*cos(0.75*pi)+a(i+1,j)*cos(0.75*pi)*cos(0.25*pi)+a(i+1,j+1)*cos(0.75*pi)*cos(0.75*pi)];
    end
end
for i=1:2:A
    for j=1:2:B
        %00
        Ans_IDCT(i,j)=2/n*[(2^-0.5)*(2^-0.5)*Ans_DCT(i,j)*cos(0)*cos(0)+(2^-0.5)*1*Ans_DCT(i,j+1)*cos(0)*cos(0.25*pi)+1*(2^-0.5)*Ans_DCT(i+1,j)*cos(0.25*pi)*cos(0)+1*1*Ans_DCT(i+1,j+1)*cos(0.25*pi)*cos(0.25*pi)];
        %01
        Ans_IDCT(i,j+1)=2/n*[(2^-0.5)*(2^-0.5)*Ans_DCT(i,j)*cos(0)*cos(0)+(2^-0.5)*1*Ans_DCT(i,j+1)*cos(0)*cos(0.75*pi)+1*(2^-0.5)*Ans_DCT(i+1,j)*cos(0.25*pi)*cos(0)+1*1*Ans_DCT(i+1,j+1)*cos(0.25*pi)*cos(0.75*pi)];
        %10
        Ans_IDCT(i+1,j)=2/n*[(2^-0.5)*(2^-0.5)*Ans_DCT(i,j)*cos(0)*cos(0)+(2^-0.5)*1*Ans_DCT(i,j+1)*cos(0)*cos(0.25*pi)+1*(2^-0.5)*Ans_DCT(i+1,j)*cos(0.75*pi)*cos(0)+1*1*Ans_DCT(i+1,j+1)*cos(0.75*pi)*cos(0.25*pi)];
        %11
        Ans_IDCT(i+1,j+1)=2/n*[(2^-0.5)*(2^-0.5)*Ans_DCT(i,j)*cos(0)*cos(0)+(2^-0.5)*1*Ans_DCT(i,j+1)*cos(0)*cos(0.75*pi)+1*(2^-0.5)*Ans_DCT(i+1,j)*cos(0.75*pi)*cos(0)+1*1*Ans_DCT(i+1,j+1)*cos(0.75*pi)*cos(0.75*pi)];
    end
end

for i=1:1:A
    for j=1:1:B
        AAA(i,j)=a(i,j)-Ans_IDCT(i,j);
    end
end

Ans_IDCT
AAA
% imshow(Ans_DCT)
% imwrite(Ans_DCT,'lena_DCT.png')
% imwrite(Ans_IDCT,'lena_IDCT.png')


