function s = sampling(R, n)
% 選擇抽樣，R為記錄集合，n為抽取的樣本數
% 演算法參考：D. E. Knuth, TAOCP, vol.2, pp142，稍有改動
% 編寫函式時用的測試資料
if ~nargin
R = 1 : 8;
n = 4;
end
N = length(R);
t = 0;   % 處理過的記錄總數
m = 0;   % 已選得的記錄數
while 1
U  = rand;
if (N-t)*U < n-m
m = m + 1;
s(m) = R(t+1);
% 若已抽取到足夠的記錄，則演算法終止
if m >= n, break, end
end
t = t + 1;
end