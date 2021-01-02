clc;clear all;close all;
in_image=imread('lena.bmp');

% The array of variables needed for "u", "v", "i", "j" in the FDCT formula
cosines_DCT = [1.0000  1.0000  1.0000  1.0000  1.0000  1.0000  1.0000  1.0000
               0.9808  0.8315  0.5556  0.1951 -0.1951 -0.5556 -0.8315 -0.9808
               0.9239  0.3827 -0.3827 -0.9239 -0.9239 -0.3827  0.3827  0.9239
               0.8315 -0.1951 -0.9808 -0.5556  0.5556  0.9808  0.1951 -0.8315
               0.7071 -0.7071 -0.7071  0.7071  0.7071 -0.7071 -0.7071  0.7071
               0.5556 -0.9808  0.1951  0.8315 -0.8315 -0.1951  0.9808 -0.5556
               0.3827 -0.9239  0.9239 -0.3827 -0.3827  0.9239 -0.9239  0.3827
               0.1951 -0.5556  0.8315 -0.9808  0.9808 -0.8315  0.5556 -0.1951];

alpha_DCT = [0.1250  0.1768  0.1768  0.1768  0.1768  0.1768  0.1768  0.1768
             0.1768  0.2500  0.2500  0.2500  0.2500  0.2500  0.2500  0.2500
             0.1768  0.2500  0.2500  0.2500  0.2500  0.2500  0.2500  0.2500
             0.1768  0.2500  0.2500  0.2500  0.2500  0.2500  0.2500  0.2500
             0.1768  0.2500  0.2500  0.2500  0.2500  0.2500  0.2500  0.2500
             0.1768  0.2500  0.2500  0.2500  0.2500  0.2500  0.2500  0.2500
             0.1768  0.2500  0.2500  0.2500  0.2500  0.2500  0.2500  0.2500
             0.1768  0.2500  0.2500  0.2500  0.2500  0.2500  0.2500  0.2500];
         
% The array of variables needed for "u", "v", "i", "j" in the FIDCT formula
cosines_IDCT = [1.0000  1.0000  1.0000  1.0000  1.0000  1.0000  1.0000  1.0000
                0.9808  0.8315  0.5556  0.1951 -0.1951 -0.5556 -0.8315 -0.9808
                0.9239  0.3827 -0.3827 -0.9239 -0.9239 -0.3827  0.3827  0.9239
                0.8315 -0.1951 -0.9808 -0.5556  0.5556  0.9808  0.1951 -0.8315
                0.7071 -0.7071 -0.7071  0.7071  0.7071 -0.7071 -0.7071  0.7071
                0.5556 -0.9808  0.1951  0.8315 -0.8315 -0.1951  0.9808 -0.5556
                0.3827 -0.9239  0.9239 -0.3827 -0.3827  0.9239 -0.9239  0.3827
                0.1951 -0.5556  0.8315 -0.9808  0.9808 -0.8315  0.5556 -0.1951];

alpha_IDCT = [0.1250  0.1768  0.1768  0.1768  0.1768  0.1768  0.1768  0.1768
              0.1768  0.2500  0.2500  0.2500  0.2500  0.2500  0.2500  0.2500
              0.1768  0.2500  0.2500  0.2500  0.2500  0.2500  0.2500  0.2500
              0.1768  0.2500  0.2500  0.2500  0.2500  0.2500  0.2500  0.2500
              0.1768  0.2500  0.2500  0.2500  0.2500  0.2500  0.2500  0.2500
              0.1768  0.2500  0.2500  0.2500  0.2500  0.2500  0.2500  0.2500
              0.1768  0.2500  0.2500  0.2500  0.2500  0.2500  0.2500  0.2500
              0.1768  0.2500  0.2500  0.2500  0.2500  0.2500  0.2500  0.2500];
O_DCT = double(zeros(8,8));
O_IDCT = double(zeros(8,8));

[A,B] = size(in_image);
for i=1:8:A
   for j=1:8:B
%        Create an 8*8 array with the input image divided into 8*8 values
       I=[in_image(i,j) in_image(i,j+1) in_image(i,j+2) in_image(i,j+3) in_image(i,j+4) in_image(i,5) in_image(i,6) in_image(i,7);
          in_image(i+1,j) in_image(i+1,j+1) in_image(i+1,j+2) in_image(i+1,j+3) in_image(i+1,j+4) in_image(i+1,5) in_image(i+1,6) in_image(i+1,7);
          in_image(i+2,j) in_image(i+2,j+1) in_image(i+2,j+2) in_image(i+2,j+3) in_image(i+2,j+4) in_image(i+2,5) in_image(i+2,6) in_image(i+2,7);
          in_image(i+3,j) in_image(i+3,j+1) in_image(i+3,j+2) in_image(i+3,j+3) in_image(i+3,j+4) in_image(i+3,5) in_image(i+3,6) in_image(i+3,7);
          in_image(i+4,j) in_image(i+4,j+1) in_image(i+4,j+2) in_image(i+4,j+3) in_image(i+4,j+4) in_image(i+4,5) in_image(i+4,6) in_image(i+1,7);
          in_image(i+5,j) in_image(i+5,j+1) in_image(i+5,j+2) in_image(i+5,j+3) in_image(i+5,j+4) in_image(i+5,5) in_image(i+5,6) in_image(i+1,7);
          in_image(i+6,j) in_image(i+6,j+1) in_image(i+6,j+2) in_image(i+6,j+3) in_image(i+6,j+4) in_image(i+6,5) in_image(i+6,6) in_image(i+6,7);
          in_image(i+7,j) in_image(i+7,j+1) in_image(i+7,j+2) in_image(i+7,j+3) in_image(i+7,j+4) in_image(i+7,5) in_image(i+7,6) in_image(i+7,7)];
      
%       Start calculating FDCT, input is I array, output is O_DCT array
        for p = 1 : 8
            for q = 1 : 8
                s_DCT = double(0);
                for m = 1 : 8
                    for n = 1 : 8
%                       Make the sigma part behind the formula
                        s_DCT = s_DCT + (double(I(m,n)) * cosines_DCT(p,m) * cosines_DCT(q,n));
                    end
                end
%                Do the multiplication of C(u)C(v) in front of the formula
                O_DCT(p,q) = alpha_DCT(p,q) * s_DCT;
            end
        end
       for aa=1:1:8
            for bb=1:1:8
                Ans_FDCT(i+aa-1,j+bb-1)=uint8(O_DCT(aa,bb));
            end
        end  
%       Start calculating FIDCT, input is O_DCT array, output is O_IDCT array
        for m = 1 : 8
            for n = 1 : 8
                s_IDCT = double(0);
                for p = 1 : 8
                    for q = 1 : 8
%                       Do the sigma and multiplication part of the formula
                        s_IDCT = s_IDCT + (alpha_IDCT(p,q) * double(O_DCT(p,q)) * cosines_IDCT(p,m) * cosines_IDCT(q,n));
                    end
                end
%               Store results
                O_IDCT(m,n) = s_IDCT;
            end
        end
        
%       Combine the results of FIDCT conversion from multiple 8*8 arrays --> a whole image
        for aa=1:1:8
            for bb=1:1:8
                Ans_FIDCT(i+aa-1,j+bb-1)=uint8(O_IDCT(aa,bb));
            end
        end  
   end
end

imshow(Ans_FIDCT)
imwrite(Ans_FIDCT,'lena_FIDCT.png')
imwrite(Ans_FDCT,'lena_FDCT.png')