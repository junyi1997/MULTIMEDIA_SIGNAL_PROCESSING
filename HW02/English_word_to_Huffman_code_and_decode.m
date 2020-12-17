clc;clear all;close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%            input English and space only            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

String_input ="weather is cold ";


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                  coding start                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

eng_list=["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"," "];
count_val=0;                                         % Word counter
count_zero=0;                                        % Has 0 counter
count_coding=0;                                      % Calculate the coding number counter

for i=1:1:27
    n(2,i) = count(String_input, eng_list(1,i));     % Count the number of occurrences of each letter
    count_val=count_val+n(2,i);                      % Count the total number of words
end

for i=1:1:27
    n(3,i) = n(2,i) / count_val;                     % Calculate the probability of each letter
    pa(1,i)=n(3,i);                                  
end

[B,I]=sort(pa);                                      % Sort B = Probability of occurrence I = Index after sorting
 
for i=1:1:27
    if B(1,i)==0
        count_zero=count_zero+1;                     % Count a few zeros
    end
end

for i=1:1:27
    if B(1,i)~=0
        sort_num(1,i-count_zero)=eng_list(1,I(1,i)); % Sort after removing zero, index-->symbol
    end
end
count_coding=27-count_zero;
k=0;
for i=1:1:count_coding
    for j = 1:1:i-1
        k=k*10+1;
    end
    if i ~= count_coding
        coding_num1(1,i)=k*10;
    else
        coding_num1(1,i)=k;
    end 
    k=0;
end

coding_Ans=String_input;
for j=1:1:count_coding
    coding_Ans=strrep(coding_Ans,sort_num(1,j),int2str(coding_num1(1,j))); %Letters are converted into huffman coding
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                   coding end                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                 decoding_start                     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

decoding_val=findstr(coding_Ans, '0');                                     %Found 0 address
decoding_sub(1,1)=decoding_val(1,1);                                       %To know the address difference between two adjacent zeros, first fill in the prime minister, because the array does not have the zeroth item
a=0;b=0;
for i=2:1:length(decoding_val)
    decoding_sub(1,i)=decoding_val(1,i)-decoding_val(1,i-1);
end

for i=2:1:length(decoding_val)
    if decoding_sub(1,i) > (count_coding-1)                                %If the subtracted number is greater than the code length of the largest codebook content
        
        a=a+1;                                                             %Know that this is the code length greater than the largest codebook content
        index(1,a)=i;                                                      %Store its index item
        sub_val(1,a)=fix(decoding_sub(1,i)/(count_coding-1));              %How many older
        mod_val(1,a)=mod(decoding_sub(1,i),(count_coding-1));              %The last yard left

        for k=1:1:sub_val(1,a)
            add(1,k)=count_coding;                                         %Combine the codes to be replaced (all ones)
        end
        
        if mod_val(1,a) ~= 0
            add(1,sub_val(1,a)+1)=mod_val(1,a);                            %Combine the code to be replaced (the last code)
        else
            add(1,sub_val(1,a))=count_coding-1;                            %Combine the code to be replaced (the last code)
        end
        
        if a==1
             decoding= [decoding_sub(1:index(1,1)-1) add(1,1:end) decoding_sub(index(1,1)+1:end)];%Put the first code to be replaced into
        else
            decoding= [decoding(1:index(1,a)-1+b) add(1,1:end) decoding(index(1,a)+1+b:end)];%Put other codes to be replaced into
        end
        b=b+length(add)-1;                                                 %Calculate the value of index to be inserted into the array
        add=[];                                                            %Empty storage
    end
end
% add
% index
% decoding_sub

decoding_Ans=decoding;                                                     %Copy the data to another array
for i=1:1:length(decoding)
    decoding_Ans=strrep(decoding_Ans,decoding(1,i),sort_num(1,decoding(1,i)));%huffman coding into letters
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                  decoding_end                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                   Show the answer                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
String_input                                                               %English words to be encoded
coding_Ans                                                                 %The result after Huffman encoding
decoding_Ans                                                               %The decoded text