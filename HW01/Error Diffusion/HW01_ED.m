%Code by : Chen Xue Wen

%FloydED
clc;clear all;close all;
INPUT = 'lena.bmp';
in_img = imread(INPUT);

inImg = double(in_img);
[M,N] = size(inImg);
x = inImg;
y_1975 = inImg;
y_1976 = inImg;
y_1981 = inImg;
Threshold = 128;


%Raster Scan_1975
for row = 1: +1 : N
    for column = 1: +1 : M
                    
        if y_1975(column,row) > Threshold
            error = -255 + y_1975(column,row);
            y_1975(column,row) = 255;
        else
            error = 0 + y_1975(column,row);
            y_1975(column,row) = 0;
        end
        if column == 1 && row < N %Left Boundary
            
            
            y_1975(column+1,row) = y_1975(column+1,row)+(7/16)*error;
            y_1975(column,row+1) = y_1975(column,row+1)+(5/16)*error;
            y_1975(column+1,row+1) = y_1975(column+1,row+1)+(1/16)*error;
            
        elseif column == M && row < N %Right Boundary
            
            y_1975(column,row+1) = y_1975(column,row+1)+(5/16)*error;
            y_1975(column-1,row+1) = y_1975(column-1,row+1)+(3/16)*error;
            
        elseif row == N && column < M %Last Row Boundary
            
            y_1975(column+1,row) = y_1975(column+1,row)+(7/16)*error;
            
        elseif row == 0 && column == M %topright
            
            y_1975(column,row+1) = y_1975(column,row+1)+(5/16)*error;
            y_1975(column-1,row+1) = y_1975(column-1,row+1)+(3/16)*error;
            
        elseif row == M && column == N %Bottomright
            
            
        else
            
            y_1975(column+1,row) = y_1975(column+1,row)+(7/16)*error;
            y_1975(column,row+1) = y_1975(column,row+1)+(5/16)*error;
            y_1975(column+1,row+1) = y_1975(column+1,row+1)+(1/16)*error;
            y_1975(column-1,row+1) = y_1975(column-1,row+1)+(3/16)*error;
            
        end
        
    end
end

%Raster Scan_1976
for row = 1: +1 : N
    for column = 1: +1 : M
            if y_1976(column ,row) > Threshold
                error = -255 + y_1976(column ,row);
                y_1976(column ,row) = 255;                
            else
                error = 0 + y_1976(column ,row);
                y_1976(column ,row) = 0;                
            end
            %Boundary Condition
            
            if column  == 1 && row < N-1 %Left Column X == 1
                y_1976(column +1,row) = y_1976(column +1,row)+(7/48)*error;
                y_1976(column +2,row) = y_1976(column +2,row)+(5/48)*error;
                y_1976(column ,row+1) = y_1976(column ,row+1)+(7/48)*error;
                y_1976(column +1,row+1) = y_1976(column+1,row+1)+(5/48)*error;
                y_1976(column +2,row+1) = y_1976(column+2,row+1)+(3/48)*error;
                y_1976(column ,row+2) = y_1976(column ,row+2)+(5/48)*error;
                y_1976(column +1,row+2) = y_1976(column+1,row+2)+(3/48)*error;
                y_1976(column +2,row+2) = y_1976(column+2,row+2)+(1/48)*error;
                           
            elseif column  == 1 && row == N-1 %BottomLeftBox
                y_1976(column +1,row) = y_1976(column +1,row)+(7/48)*error;
                y_1976(column +2,row) = y_1976(column +2,row)+(5/48)*error;
                y_1976(column ,row+1) = y_1976(column ,row+1)+(7/48)*error;
                y_1976(column +1,row+1) = y_1976(column+1,row+1)+(5/48)*error;
                y_1976(column +2,row+1) = y_1976(column+2,row+1)+(3/48)*error;
                
            elseif column ==2 && row==N-1
                y_1976(column +1,row) = y_1976(column +1,row)+(7/48)*error;
                y_1976(column +2,row) = y_1976(column +2,row)+(5/48)*error;
                y_1976(column -1,row+1) = y_1976(column-1,row+1)+(5/48)*error;
                y_1976(column ,row+1) = y_1976(column ,row+1)+(7/48)*error;
                y_1976(column +1,row+1) = y_1976(column+1,row+1)+(5/48)*error;
                y_1976(column +2,row+1) = y_1976(column+2,row+1)+(3/48)*error;
 
            elseif column ==1 && row==N
                y_1976(column +1,row) = y_1976(column +1,row)+(7/48)*error;
                y_1976(column +2,row) = y_1976(column +2,row)+(5/48)*error;
                
            elseif column ==2 && row==N
                y_1976(column +1,row) = y_1976(column +1,row)+(7/48)*error;
                y_1976(column +2,row) = y_1976(column +2,row)+(5/48)*error;
 
            elseif column ==M-1 && row==N-1
                y_1976(column +1,row) = y_1976(column +1,row)+(7/48)*error;
                y_1976(column -2,row+1) = y_1976(column-2,row+1)+(3/48)*error;
                y_1976(column -1,row+1) = y_1976(column-1,row+1)+(5/48)*error;
                y_1976(column ,row+1) = y_1976(column ,row+1)+(7/48)*error;
                y_1976(column +1,row+1) = y_1976(column+1,row+1)+(5/48)*error;
 
            elseif column ==M && row==N-1
                y_1976(column -2,row+1) = y_1976(column-2,row+1)+(3/48)*error;
                y_1976(column -1,row+1) = y_1976(column -1,row+1)+(5/48)*error;
                y_1976(column ,row+1) = y_1976(column ,row+1)+(7/48)*error;
                
            elseif column ==M-1 && row==N
                y_1976(column +1,row) = y_1976(column +1,row)+(7/48)*error;
                
            elseif column ==M && row==N
                %Do Nothing
                               
            elseif column  == 2 && row < N-1 %Left Column = 2
                y_1976(column +1,row) = y_1976(column +1,row)+(7/48)*error;
                y_1976(column +2,row) = y_1976(column +2,row)+(5/48)*error;
                y_1976(column -1,row+1) = y_1976(column-1,row+1)+(5/48)*error;
                y_1976(column ,row+1) = y_1976(column ,row+1)+(7/48)*error;
                y_1976(column +1,row+1) = y_1976(column+1,row+1)+(5/48)*error;
                y_1976(column +2,row+1) = y_1976(column+2,row+1)+(3/48)*error;
                y_1976(column -1,row+2) = y_1976(column-1,row+2)+(3/48)*error;
                y_1976(column ,row+2) = y_1976(column ,row+2)+(5/48)*error;
                y_1976(column +1,row+2) = y_1976(column+1,row+2)+(3/48)*error;
                y_1976(column +2,row+2) = y_1976(column+2,row+2)+(1/48)*error;
 
                
            elseif column  == M-1 && row < N-1 %Right Column  == M-1
                y_1976(column +1,row) = y_1976(column +1,row)+(7/48)*error;
                y_1976(column -2,row+1) = y_1976(column-2,row+1)+(3/48)*error;
                y_1976(column -1,row+1) = y_1976(column-1,row+1)+(5/48)*error;
                y_1976(column ,row+1) = y_1976(column ,row+1)+(7/48)*error;
                y_1976(column +1,row+1) = y_1976(column+1,row+1)+(5/48)*error;
                y_1976(column -2,row+2) = y_1976(column-2,row+2)+(1/48)*error;
                y_1976(column -1,row+2) = y_1976(column-1,row+2)+(3/48)*error;
                y_1976(column ,row+2) = y_1976(column ,row+2)+(5/48)*error;
                y_1976(column +1,row+2) = y_1976(column+1,row+2)+(3/48)*error;
                
            elseif column  == M && row < N-1 %Right Column  == M
                y_1976(column -2,row+1) = y_1976(column-2,row+1)+(3/48)*error;
                y_1976(column -1,row+1) = y_1976(column-1,row+1)+(5/48)*error;
                y_1976(column ,row+1) = y_1976(column ,row+1)+(7/48)*error;
                y_1976(column -2,row+2) = y_1976(column -2,row+2)+(1/48)*error;
                y_1976(column -1,row+2) = y_1976(column -1,row+2)+(3/48)*error;
                y_1976(column ,row+2) = y_1976(column ,row+2)+(5/48)*error;
 
                
            elseif 2<column <M-1 && row==N-1
                y_1976(column +1,row) = y_1976(column +1,row)+(7/48)*error;
                y_1976(column +2,row) = y_1976(column +2,row)+(5/48)*error;
                y_1976(column -2,row+1) = y_1976(column -2,row+1)+(3/48)*error;
                y_1976(column -1,row+1) = y_1976(column -1,row+1)+(5/48)*error;
                y_1976(column ,row+1) = y_1976(column ,row+1)+(7/48)*error;
                y_1976(column +1,row+1) = y_1976(column +1,row+1)+(5/48)*error;
                y_1976(column +2,row+1) = y_1976(column +2,row+1)+(3/48)*error;
 
            elseif 2<column <M-1 && row==N
                y_1976(column +1,row) = y_1976(column +1,row)+(7/48)*error;
                y_1976(column +2,row) = y_1976(column +2,row)+(5/48)*error;
                
            else %All the other Pixel
                y_1976(column +1,row) = y_1976(column +1,row)+(7/48)*error;
                y_1976(column +2,row) = y_1976(column +2,row)+(5/48)*error;
                y_1976(column -2,row+1) = y_1976(column -2,row+1)+(3/48)*error;
                y_1976(column -1,row+1) = y_1976(column -1,row+1)+(5/48)*error;
                y_1976(column ,row+1) = y_1976(column ,row+1)+(7/48)*error;
                y_1976(column +1,row+1) = y_1976(column +1,row+1)+(5/48)*error;
                y_1976(column +2,row+1) = y_1976(column +2,row+1)+(3/48)*error;
                y_1976(column -2,row+2) = y_1976(column -2,row+2)+(1/48)*error;
                y_1976(column -1,row+2) = y_1976(column -1,row+2)+(3/48)*error;
                y_1976(column ,row+2) = y_1976(column ,row+2)+(5/48)*error;
                y_1976(column +1,row+2) = y_1976(column +1,row+2)+(3/48)*error;
                y_1976(column +2,row+2) = y_1976(column +2,row+2)+(1/48)*error;
                
            end
            
    end
end

%Raster Scan_1981
for row = 1: +1 : N
    for column = 1: +1 : M
            if y_1981(column,row) > Threshold
                error = -255 + y_1981(column,row);
                y_1981(column,row) = 255;                
            else
                error = 0 + y_1981(column,row);
                y_1981(column,row) = 0;                
            end
            %Boundary Condition
            
            if column == 1 && row < N-1 %Left Column column == 1
                y_1981(column+1,row) = y_1981(column+1,row)+(8/42)*error;
                y_1981(column+2,row) = y_1981(column+2,row)+(4/42)*error;
                y_1981(column,row+1) = y_1981(column,row+1)+(8/42)*error;
                y_1981(column+1,row+1) = y_1981(column+1,row+1)+(4/42)*error;
                y_1981(column+2,row+1) = y_1981(column+2,row+1)+(2/42)*error;
                y_1981(column,row+2) = y_1981(column,row+2)+(4/42)*error;
                y_1981(column+1,row+2) = y_1981(column+1,row+2)+(2/42)*error;
                y_1981(column+2,row+2) = y_1981(column+2,row+2)+(1/42)*error;
                
            elseif column == 1 && row == N-1 %BottomLeftBox
                y_1981(column+1,row) = y_1981(column+1,row)+(8/42)*error;
                y_1981(column+2,row) = y_1981(column+2,row)+(4/42)*error;
                y_1981(column,row+1) = y_1981(column,row+1)+(8/42)*error;
                y_1981(column+1,row+1) = y_1981(column+1,row+1)+(4/42)*error;
                y_1981(column+2,row+1) = y_1981(column+2,row+1)+(2/42)*error;
                
            elseif column==2 && row==N-1
                y_1981(column+1,row) = y_1981(column+1,row)+(8/42)*error;
                y_1981(column+2,row) = y_1981(column+2,row)+(4/42)*error;
                y_1981(column-1,row+1) = y_1981(column-1,row+1)+(4/42)*error;
                y_1981(column,row+1) = y_1981(column,row+1)+(8/42)*error;
                y_1981(column+1,row+1) = y_1981(column+1,row+1)+(4/42)*error;
                y_1981(column+2,row+1) = y_1981(column+2,row+1)+(2/42)*error;
                
            elseif column==1 && row==N
                y_1981(column+1,row) = y_1981(column+1,row)+(8/42)*error;
                y_1981(column+2,row) = y_1981(column+2,row)+(4/42)*error;
            elseif column==2 && row==N
                y_1981(column+1,row) = y_1981(column+1,row)+(8/42)*error;
                y_1981(column+2,row) = y_1981(column+2,row)+(4/42)*error;
                
            elseif column==M-1 && row==N-1
                y_1981(column+1,row) = y_1981(column+1,row)+(8/42)*error;
                y_1981(column-2,row+1) = y_1981(column-2,row+1)+(2/42)*error;
                y_1981(column-1,row+1) = y_1981(column-1,row+1)+(4/42)*error;
                y_1981(column,row+1) = y_1981(column,row+1)+(8/42)*error;
                y_1981(column+1,row+1) = y_1981(column+1,row+1)+(4/42)*error;
                
            elseif column==M && row==N-1
                y_1981(column-2,row+1) = y_1981(column-2,row+1)+(2/42)*error;
                y_1981(column-1,row+1) = y_1981(column-1,row+1)+(4/42)*error;
                y_1981(column,row+1) = y_1981(column,row+1)+(8/42)*error;
                
            elseif column==M-1 && row==N
                y_1981(column+1,row) = y_1981(column+1,row)+(8/42)*error;
                
            elseif column==M && row==N
                %Do Nothing
                               
            elseif column == 2 && row < N-1 %Left Column column = 2
                y_1981(column+1,row) = y_1981(column+1,row)+(8/42)*error;
                y_1981(column+2,row) = y_1981(column+2,row)+(4/42)*error;
                y_1981(column,row+1) = y_1981(column,row+1)+(8/42)*error;
                y_1981(column+1,row+1) = y_1981(column+1,row+1)+(4/42)*error;
                y_1981(column+2,row+1) = y_1981(column+2,row+1)+(2/42)*error;
                y_1981(column,row+2) = y_1981(column,row+2)+(4/42)*error;
                y_1981(column+1,row+2) = y_1981(column+1,row+2)+(2/42)*error;
                y_1981(column+2,row+2) = y_1981(column+2,row+2)+(1/42)*error;
                y_1981(column-1,row+1) = y_1981(column-1,row+1)+(4/42)*error;
                y_1981(column-1,row+2) = y_1981(column-1,row+2)+(2/42)*error;
                
                
            elseif column == M-1 && row < N-1 %Right Column column == M-1
                y_1981(column+1,row) = y_1981(column+1,row)+(8/42)*error;
                y_1981(column-2,row+1) = y_1981(column-2,row+1)+(2/42)*error;
                y_1981(column-1,row+1) = y_1981(column-1,row+1)+(4/42)*error;
                y_1981(column,row+1) = y_1981(column,row+1)+(8/42)*error;
                y_1981(column+1,row+1) = y_1981(column+1,row+1)+(4/42)*error;
                y_1981(column-2,row+2) = y_1981(column-2,row+2)+(1/42)*error;
                y_1981(column-1,row+2) = y_1981(column-1,row+2)+(2/42)*error;
                y_1981(column,row+2) = y_1981(column,row+2)+(4/42)*error;
                y_1981(column+1,row+2) = y_1981(column+1,row+2)+(2/42)*error;
                
            elseif column == M && row < N-1 %Right Column column == M
                y_1981(column-2,row+1) = y_1981(column-2,row+1)+(2/42)*error;
                y_1981(column-1,row+1) = y_1981(column-1,row+1)+(4/42)*error;
                y_1981(column,row+1) = y_1981(column,row+1)+(8/42)*error;
                y_1981(column-2,row+2) = y_1981(column-2,row+2)+(1/42)*error;
                y_1981(column-1,row+2) = y_1981(column-1,row+2)+(2/42)*error;
                y_1981(column,row+2) = y_1981(column,row+2)+(4/42)*error;
                
            elseif 2<column<M-1 && row==N-1
                y_1981(column+1,row) = y_1981(column+1,row)+(8/42)*error;
                y_1981(column+2,row) = y_1981(column+2,row)+(4/42)*error;
                y_1981(column-2,row+1) = y_1981(column-2,row+1)+(2/42)*error;
                y_1981(column-1,row+1) = y_1981(column-1,row+1)+(4/42)*error;
                y_1981(column,row+1) = y_1981(column,row+1)+(8/42)*error;
                y_1981(column+1,row+1) = y_1981(column+1,row+1)+(4/42)*error;
                y_1981(column+2,row+1) = y_1981(column+2,row+1)+(2/42)*error;
                
            elseif 2<column<M-1 && row==N
                y_1981(column+1,row) = y_1981(column+1,row)+(8/42)*error;
                y_1981(column+2,row) = y_1981(column+2,row)+(4/42)*error;
                
            else %All the other Pixel
                y_1981(column+1,row) = y_1981(column+1,row)+(8/42)*error;
                y_1981(column+2,row) = y_1981(column+2,row)+(4/42)*error;
                y_1981(column-2,row+1) = y_1981(column-2,row+1)+(2/42)*error;
                y_1981(column-1,row+1) = y_1981(column-1,row+1)+(4/42)*error;
                y_1981(column,row+1) = y_1981(column,row+1)+(8/42)*error;
                y_1981(column+1,row+1) = y_1981(column+1,row+1)+(4/42)*error;
                y_1981(column+2,row+1) = y_1981(column+2,row+1)+(2/42)*error;
                y_1981(column-2,row+2) = y_1981(column-2,row+2)+(1/42)*error;
                y_1981(column-1,row+2) = y_1981(column-1,row+2)+(2/42)*error;
                y_1981(column,row+2) = y_1981(column,row+2)+(4/42)*error;
                y_1981(column+1,row+2) = y_1981(column+1,row+2)+(2/42)*error;
                y_1981(column+2,row+2) = y_1981(column+2,row+2)+(1/42)*error;
                
            end
            
    end
end




% figure;
subplot(221);
imshow(in_img);title('Input Image');
subplot(222);
imshow(y_1975);title('Error Diffusion-Floyd-Steinberg-1975');
subplot(223);
imshow(y_1976);title('Error Diffusion-Jarvis-1976');
subplot(224);
imshow(y_1981);title('Error Diffusion-Stucki-1981');
