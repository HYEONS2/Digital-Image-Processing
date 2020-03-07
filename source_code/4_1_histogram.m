%dark image histogram
I=imread('../image/dark.tif');
figure(1); imshow(I);

h=histogram(I(:),0:255); % ���� I�� ���ȭ �� ��� 0~255���� �׷���

%%
%h = 

%  Histogram - �Ӽ� ����:

%             Data: [1042441��1 uint8]
%           Values: [1��255 double]
%          NumBins: 255
%        BinEdges: [1��256 double]
%         BinWidth: 1
%       BinLimits: [0 255]
%    Normalization: 'count'
%        FaceColor: 'auto'
%        EdgeColor: [0 0 0]
%
%%
[h b]=hist(I(:),0:255) % h�� bin ��, b�� ���� index
%figure(2); plot(0:255,h.Values);
figure(2); plot(b,h); % x���� ������, y�� ���� count�� ��

%%
%light image histogram
I=imread('../image/light.tif');
figure(3); imshow(I);
[h b]=hist(I(:),0:255); 
figure(4); bar(b,h); %plot ��ſ� bar�� ���� ¦���� ����

clc;
%%
I=imread('../image/light.tif');
Ih=myhisteq(I);
figure(3); imshow(Ih);

%%
I=imread('../image/light.tif');
[ M, N ] = size(I);

for i=1:10 % Input image�� �ִ��� ����
    for j=1:10
        I(i,j)
        I(i,j)+1
    end
end