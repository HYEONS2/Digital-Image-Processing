BW=logical([1 1 1 0 0 1 1;
    0 0 1 0 0 0 1;
    0 1 1 1 0 0 0;
    0 0 0 0 1 0 0])

 %�츮�� ���� ��޾��ϸ� MATLAB������ double�� ����
 %loagical �ϸ� �� byte�� ����
figure(1); imagesc(BW); %auto scale, ���е����ʹ� �̰ɷ� �ַ� ���
figure(2); imshow(BW); % �ڵ�����ŭ ����

L=bwlabel(BW,8); %blob label with 8 adiacency %���� �����ִ� Color label ���ڷ� ����
L=bwlabel(BW,4);
figure(3); imagesc(L); colorbar; % color label����
colormap jet % �� ������ó�� ����
colormap bone % ���ٱ� ����

%find specific region
[r c]=find(L==3); %row col
rc=[r c];
figure(3); hold on;
plot(c,r, 'c+','markersize',15); %c+:��Ŀ ���ڰ�, ��Ŀ 15 ������

I=imread('../image/rice.png');
figure(1); subplot(1,3,1); imshow(I);

%binarization by thresholding
Ib=I>150; 
figure(1); subplot(1,3,2); imshow(Ib);

%blob labeling
L=bwlabel(Ib,8);
figure(1); subplot(1,3,3); imagesc(L);
colormap jet;

%%

I=imread('../image/rice.png');
figure(1); subplot(1,2,1); imshow(I);

%binarization by thresholding
Ib=I>150; 
figure(1); subplot(1,2,2); imshow(Ib);


%blob labeling
L=bwlabel(Ib,8);
figure(2); imagesc(L);
colormap jet; colorbar
