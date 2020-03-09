I = imread('../image/myimg.jpg');
I = rgb2gray(I); % ���ȭ
I = imresize(I, [512, 512]); % rectangle �������߱� (����������) 
subplot(2,3,1); imshow(I); title('original image');

F = fft2(I); %�н�Ʈ ǻ���� Ʈ������
Fmag = abs(F); % �̹����� ���� magnitude, 0 phase 
Fphase = exp(1i*angle(F)); % magnitude 1, �̹����� ���� phase 

% reconstruction
Remag = log(abs(ifft2(Fmag*exp(i*0)))+1); %magnitude inverse ǻ����
Rephase = ifft2(Fphase); %phase invers ǻ����

subplot(2,3,2); imshow(Fphase); title('Phase');
subplot(2,3,3),imshow(Rephase,[]), colormap gray 
title('Reconstructed Phase');
subplot(2,3,4),imshow(Remag,[]), colormap gray 
title('Reconstructed Spec');

% Rectangle
I2=imread('rectangle.tif');
F2=fft2(I2); %�н�Ʈ ǻ���� Ʈ������
F2mag= abs(F2); 
F2phase = exp(1i*angle(F2));

a1=F2mag.*Fphase; a2=ifft2(a1); %rect mag + my phase, after inverse ǻ����
subplot(2,3,5); imshow(a2,[]); title('My phase+Rect spec')
b1=Fmag.*F2phase; b2=ifft2(b1); %my mag + rect phase, after inverse ǻ����
subplot(2,3,6); imshow(b2,[]); title('Rect phase+My spec ')

