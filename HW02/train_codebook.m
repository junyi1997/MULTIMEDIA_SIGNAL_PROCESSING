clc;clear all;close all;

A2=[27  107  13  39  133  194  164  39  167  148  223  108  112  70  113  180  169  192  203  104  116  240  218  37  160  23  89  4  213  127  100  117  218  64  0  65  156  189  122  53  100  165  153  33  23  226  116  74  99  196  170  48  54  17  168  162  119  81  140  86  44  208  108  102  166  222  177  175  84  174  248  96  154  132  233  239  163  80  172  157  55  221  106  95  91  63  12  137  26  164  85  52  136  218  158  7  90  203  88  163  160  223  140  236  144  231  198  93  24  15  80  15  17  191  90  228  64  18  6  54  72  116  155  199  93  250  237  226  ;
91  27  13  37  127  117  164  165  47  148  221  103  129  71  192  180  250  119  194  217  181  163  102  159  28  228  226  118  125  58  52  160  121  244  97  91  149  226  62  106  163  226  144  225  114  240  78  150  137  97  97  0  166  194  97  30  76  7  3  201  205  222  163  50  66  64  196  132  158  59  44  165  40  26  90  25  1  252  230  80  81  149  30  236  144  82  60  86  109  173  208  198  240  142  152  107  77  193  202  166  238  77  30  14  155  201  90  188  242  160  199  22  230  45  114  79  145  15  246  43  188  36  121  88  85  215  78  215  
];%Codebook after taking random random numbers

for i=1:1:10
    code_avg=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
    code_time=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
    data=double(imread("./imgdata/cameraman.tif"));
    nx=256;
    ny=256;
    for i = 1:1:nx
       for j=1:2:ny%Throw the two points in the picture as a group into the codebook to evaluate the distance
          for k = 1:1:16
              sub(1,k)=(data(i,j)-A2(1,k))^2+(data(i,j+1)-A2(2,k))^2;%Calculate the distance between each point and the node
          end
          [B,I]=sort(sub);%"B" is the look after sorting, "I" is the index of the original position before sorting
          code_avg(1,I(1,1))=code_avg(1,I(1,1))+data(i,j);%Add the points closest to the node into the variable code_avg
          code_avg(2,I(1,1))=code_avg(2,I(1,1))+data(i,j+1);
          code_time(1,I(1,1))=code_time(1,I(1,1))+1;%Calculate the accumulation times in code_time
       end
    end
    for j=1:1:2
        for i = 1:1:128
            code_avg(j,i)=code_avg(j,i)/code_time(1,i);%Average the points near the node
            if(uint8(code_avg(j,i))~=0)
                A2(j,i)=uint8(code_avg(j,i));%Write the changed data into the codebook variable
            end
        end
    end
end
fid=fopen(['./','codebook_256.txt'],'w');%Write file path
[r,c]=size(A2);% Get the number of rows and columns of the matrix
 for i=1:r
  for j=1:c
  fprintf(fid,'%f\t',uint8(A2(i,j)));%Write data to txt file
  end
  if(i==1)
      fprintf(fid,';\n');%Matlab notation for conversion to 2-dimensional matrix reduction
  else
      fprintf(fid,'\n');
  end
 end
fclose(fid);