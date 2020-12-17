clc;clear all;close all;
ccc=512;
input=imread('lena.bmp');

A_16=[27 70 110 113 149 153 169 180 183 188 192 215 223 228 240 248];
aaa_16=imread('lena.bmp');
for i=1:1:ccc
   for j = 1:1:ccc
       aaa_16(i,j);
      for k=1:1:16
          if(aaa_16(i,j)>A_16(1,k))
              sub_16(1,k)=aaa_16(i,j)-A_16(1,k);%Calculate the distance between each point and the node
          else
              sub_16(1,k)=A_16(1,k)-aaa_16(i,j);%Calculate the distance between each point and the node
          end
      end
      [B,I]=sort(sub_16);%"B" is the look after sorting, "I" is the index of the original position before sorting
      aaa_16(i,j)=A_16(I(1,1));
   end
end


A_64=[5 12 13 19 20 23 24 27 39 41 46 47 51 53 55 59 61 64 65 72 74 76 81 82 91 92 99  106 107 110 111 114 115 118 121 136 146 148 149 152 155 156 157 160 163 169 173 174 177 179 182 183 185 187 205 210 215 222 224 228 232 242 246 254];
aaa_64=imread('lena.bmp');
for i=1:1:ccc
   for j = 1:1:ccc
       aaa_64(i,j);
      for k=1:1:64
          if(aaa_64(i,j)>A_64(1,k))
              sub_64(1,k)=aaa_64(i,j)-A_64(1,k);%Calculate the distance between each point and the node
          else
              sub_64(1,k)=A_64(1,k)-aaa_64(i,j);%Calculate the distance between each point and the node
          end
      end
      [B,I]=sort(sub_64);%"B" is the look after sorting, "I" is the index of the original position before sorting
      aaa_64(i,j)=A_64(I(1,1));
   end
end

A_256=[27  107  13  39  133  194  164  39  167  148  223  108  112  70  113  180  169  192  203  104  116  240  218  37  160  23  89  4  213  127  100  117  218  64  0  65  156  189  122  53  100  165  153  33  23  226  116  74  99  196  170  48  54  17  168  162  119  81  140  86  44  208  108  102  166  222  177  175  84  174  248  96  154  132  233  239  163  80  172  157  55  221  106  95  91  63  12  137  26  164  85  52  136  218  158  7  90  203  88  163  160  223  140  236  144  231  198  93  24  15  80  15  17  191  90  228  64  18  6  54  72  116  155  199  93  250  237  226  ;
91  27  13  37  127  117  164  165  47  148  221  103  129  71  192  180  250  119  194  217  181  163  102  159  28  228  226  118  125  58  52  160  121  244  97  91  149  226  62  106  163  226  144  225  114  240  78  150  137  97  97  0  166  194  97  30  76  7  3  201  205  222  163  50  66  64  196  132  158  59  44  165  40  26  90  25  1  252  230  80  81  149  30  236  144  82  60  86  109  173  208  198  240  142  152  107  77  193  202  166  238  77  30  14  155  201  90  188  242  160  199  22  230  45  114  79  145  15  246  43  188  36  121  88  85  215  78  215  ];
aaa_256 = imread('lena.bmp');
nx=256;
ny=256;
for i = 1:1:nx
   for j=1:2:ny%Throw the two points in the picture as a group into the codebook to evaluate the distance
      for k = 1:1:16
          sub(1,k)=(aaa_256(i,j)-A_256(1,k))^2+(aaa_256(i,j+1)-A_256(2,k))^2;%Calculate the distance between each point and the node
      end
      [B,I]=sort(sub);%"B" is the look after sorting, "I" is the index of the original position before sorting
      aaa_256(i,j)=A_256(1,I(1,1));
      aaa_256(i,j+1)=A_256(2,I(1,1));
   end
end
%%
subplot(221);
imshow(input);title('Input Image');
subplot(222);
imshow(uint8(aaa_16));title('VQ-Use 16 codebooks');
subplot(223);
imshow(uint8(aaa_64));title('VQ-Use 64 codebooks');
subplot(224);
imshow(uint8(aaa_256));title('VQ-Use 256 codebooks');