% clc;clear all;close all;
% a=sampling(0:255,64);
clc;clear all;close all;
% 16 64 256 1024
num=128;
% % 
a11= uint8(255*rand(1,num));
a12= uint8(255*rand(1,num));
% a21= uint8(255*rand(1,num));
% a22= uint8(255*rand(1,num));

% a11=sampling(0:255,num);
% a12=sampling(0:255,num);
% a21=sampling(0:255,num);
% a22=sampling(0:255,num);
for n=1:1:num
    codebook(1,n)=a11(1,n);
    codebook(2,n)=a12(1,n);
%     codebook(3,n)=a21(1,n);
%     codebook(4,n)=a22(1,n);
end
codebook

fid=fopen(['./','codebook_256.txt'],'w');%寫入檔案路徑
[r,c]=size(codebook);            % 得到矩陣的行數和列數
 for i=1:r
  for j=1:c
  fprintf(fid,'%f\t',codebook(i,j));
  end
  fprintf(fid,'\r\n');
 end
fclose(fid);
