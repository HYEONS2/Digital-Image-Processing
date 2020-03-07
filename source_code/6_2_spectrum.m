I=imread('../image/rectangle.tif');
figure(1); subplot(2,2,1); imshow(I);
title('Input image');

F=fft2(I); %DFT %M�� N�� ���� ���� ���� : ������ ���� ���� : 512X512 �� �ݺ�
size(F)

absF=abs(F); subplot(2,2,2); imagesc(absF); %real �� img -> ���� �����ؼ� ���ϴ� �� 
axis image %���� �ƴ϶� axis image �������
title('Original Spectrum');

centerF=fftshift(F); %center FFT %I*(-1)^(x+y) bla bla ����� shifting �ϴµ� �ٸ� �� ����
absCenterF=abs(centerF); subplot(2,2,3); imagesc(absCenterF);
title('Centered Spectrum'); #shifted spectrum

%log intensity transform
logF=log(absCenterF+1); subplot(2,2,4); imagesc(logF);
title('Log of Centered Spectrum'); axis image;