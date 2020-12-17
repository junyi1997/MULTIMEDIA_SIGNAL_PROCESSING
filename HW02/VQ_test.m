clc;clear all;close all;
%%
tic;
a=4;
b=a*a;
input=imread('lena.bmp');
I=double(imread('lena.bmp'));
B=im2col(I,[a,a],'distinct');% Decompose the image into a 16*(128*128) matrix
[m,n]=size(B);
N=256;
CB=zeros(m,N);
CW=zeros(1,n);
rng(999);
CB_cnt=randperm(n);
CB=B(:,CB_cnt(1:N));
for x=1:10%10 iterations
    for y=1:n%training
        p=B(1:b,y)*ones(1,N);
        [~,yy]=min(sum((p-CB).^2));
        CW(y)=yy;
    end
       for z=1:N%Select
          v=find(CW==z);
          for k=1:m
               nv=sum(B(k,v))/numel(v);
               CB(k,z)=nv;
          end
       end
end
toc
DE=zeros(m,n);
for i=1:n
    DE(:,i)=CB(:,CW(i));
end
img_4=col2im(DE,[a,a],[512,512],'distinct');


%%
tic;
a=8;
b=a*a;
input=imread('lena.bmp');
I=double(imread('lena.bmp'));
B=im2col(I,[a,a],'distinct');% Decompose the image into a 64*(64*64) matrix
[m,n]=size(B);
N=256;
CB=zeros(m,N);
CW=zeros(1,n);
rng(999);
CB_cnt=randperm(n);
CB=B(:,CB_cnt(1:N));
for x=1:10%10 iterations
    for y=1:n%training
        p=B(1:b,y)*ones(1,N);
        [~,yy]=min(sum((p-CB).^2));
        CW(y)=yy;
    end
       for z=1:N%Select
          v=find(CW==z);
          for k=1:m
               nv=sum(B(k,v))/numel(v);
               CB(k,z)=nv;
          end
       end
end
toc
DE=zeros(m,n);
for i=1:n
    DE(:,i)=CB(:,CW(i));
end
img_8=col2im(DE,[a,a],[512,512],'distinct');

%%
tic;
a=16;
b=a*a;
input=imread('lena.bmp');
I=double(imread('lena.bmp'));
B=im2col(I,[a,a],'distinct');% Decompose the image into a 256*(32*32) matrix
[m,n]=size(B);
N=256;
CB=zeros(m,N);
CW=zeros(1,n);
rng(999);
CB_cnt=randperm(n);
CB=B(:,CB_cnt(1:N));
for x=1:10%10 iterations
    for y=1:n%training
        p=B(1:b,y)*ones(1,N);
        [~,yy]=min(sum((p-CB).^2));
        CW(y)=yy;
    end
       for z=1:N%Select
          v=find(CW==z);
          for k=1:m
               nv=sum(B(k,v))/numel(v);
               CB(k,z)=nv;
          end
       end
end
toc
DE=zeros(m,n);
for i=1:n
    DE(:,i)=CB(:,CW(i));
end
img_16=col2im(DE,[a,a],[512,512],'distinct');

%%
subplot(221);
imshow(input);title('Input Image');
subplot(222);
imshow(uint8(img_4));title('VQ-16*(128*128) matrix');
subplot(223);
imshow(uint8(img_8));title('VQ-64*(64*64) matrix');
subplot(224);
imshow(uint8(img_16));title('VQ-256*(32*32) matrix');


