clc;clear all;close all;
% src_path='lena.bmp'; %原始bai图片路du径zhi
% dst_path='./';%分割图片后保存dao路径
% mkdir(dst_path);%路径不存在则生成
% A = imread(src_path); %读入原始图片
% [m,n,l] = size(A); %获得zhuan尺寸
% for i = 1:64
% for j = 1:64
% m_start=1+(i-1)*fix(m/64);
% m_end=i*fix(m/64);
% n_start=1+(j-1)*fix(n/64);
% n_end=j*fix(n/64);
% AA=A(m_start:m_end,n_start:n_end,:); %将每块读入矩阵
% imwrite(AA,[dst_path num2str(i) '-' num2str(j) '.jpg'],'jpg'); %保存每块图片
% end
% end

a_word=["1"	"2"	"3"	"4"	"5"	"6"	"7"	"8"	"9"	"10" "11" "12" "13"	"14" "15" "16" "17"	"18" "19" "20" "21"	"22" "23" "24" "25" "26" "27" "28" "29" "30" "31" "32" "33" "34" "35" "36" "37" "38" "39" "40" "41" "42" "43" "44" "45" "46" "47" "48" "49" "50" "51" "52" "53" "54" "55" "56" "57" "58" "59" "60" "61" "62" "63" "64"];
b_word=['-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'	'-'];
c_word=["1"	"2"	"3"	"4"	"5"	"6"	"7"	"8"	"9"	"10" "11" "12" "13"	"14" "15" "16" "17"	"18" "19" "20" "21"	"22" "23" "24" "25" "26" "27" "28" "29" "30" "31" "32" "33" "34" "35" "36" "37" "38" "39" "40" "41" "42" "43" "44" "45" "46" "47" "48" "49" "50" "51" "52" "53" "54" "55" "56" "57" "58" "59" "60" "61" "62" "63" "64"];
d_word=[".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"	".jpg"];

c=strcat(a_word,b_word,c_word,d_word)

for i=1:1:64
    c(i)=strcat(a_word(i),b_word(i),c_word(i),d_word(i));
    Ans_FDCT(i)=DCT_8X8(c(i));
end
Ans_FDCT