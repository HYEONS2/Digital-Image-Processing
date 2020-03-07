I=imread('../image/zone-plate.png'); %���ͳ� ���� image : png 
figure(1); imshow(I); title('input');

% ���� uint8 : gray
%subsampling by resizing
interval=2;
[H W]=size(I);
Ir=[];
for i=1:interval:H
    for j=1:interval:W
        Ir(floor(i/interval)+1,floor(j/interval)+1)=I(i,j); % i/interval)+1 (0,0)��ǥ�踦 (1,1) ��ǥ��� ��ȯ
    end
end
figure(2); imagesc(Ir); title('output'); axis image; colormap gray;

%resizing after band-limiting by Gaussian convolution
g=fspecial('gaussian',5,1); % gaussian kernel --> ���� ������ �� ����
I=imfilter(I,g,'same','replicate');

interval=2;
[H W]=size(I);
Ir=[];
for i=1:interval:H
    for j=1:interval:W
        Ir(floor(i/interval)+1,floor(j/interval)+1)=I(i,j); % i/interval)+1 (0,0)��ǥ�踦 (1,1) ��ǥ��� ��ȯ
    end
end
figure(3); imagesc(Ir); title('band-limited'); axis image; colormap gray;