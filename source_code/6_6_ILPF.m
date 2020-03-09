I=imread('testPlate.tif');
figure(1); subplot(2,2,1); imshow(I); title('Input');

%FFT of input image
F=fft2(I);
Fcenter=fftshift(F); %������ �߰����� �ű�� ��ȯ �Լ�

%Magnitude,spectrum
magF=abs(Fcenter); % real�� imaginaly�� ũ��
figure(1); subplot(2,2,2); imagesc(log(1+magF)); axis image; 
title('Spectrum'); %���ļ� ũ��

%make an ideal lowpass filter mask
[M ,N]=size(I);

%���� 0,0���� �����ؼ� ���͸� ����
u=0:(M-1); v=0:(N-1);
u=u-M/2; v=v-N/2; %�߽��� �����ִ� �κ�

%������ �����ϸ鼭 Grid ������ִ� �Լ� mesh-
[V, U]=meshgrid(v,u);
D=sqrt(U.^2+V.^2); %��� �ȼ����� �߽����� ���� �Ÿ��� ����ϴ� D
figure; imagesc(D); colormap gray; axis image; colorbar;
P=10; %cut-off frequency %�����ϸ鼭 �׽�Ʈ
H=double(D<=P); %�����ϸ� 1 �ƴϸ� 0 ������ logical data�� double data�� ��ȯ
figure(1); subplot(2,2,3); imagesc(H); axis image;
title('ILPF Mask: H');

%check filter shape in spatial domain
h=real(ifft2(double(ifftshift(H))));
figure; imagesc(fftshift(h)); axis image; %colormap gray;%�������� ���� �ݴ�� �Ҷ�

%filtering in frequency domain
G=H.*Fcenter; %F�� shift ���̶�, Fcenter ���
magG=abs(G);%�̰� visualize ����
figure(1); subplot(2,2,4); imagesc(log(1+magG)); axis image;
title('Filtering: H*F');

%inverse FFT2
g=real(ifft2(double(ifftshift(G))));
figure; imshow(uint8(g)); title('Inverse FFT2');
