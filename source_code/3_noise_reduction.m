I=imread('../image/rice.png');

% noise removal
figure(20); imshow(I); title('Original');

%add noise
Noise=50*randn(size(I)); %ǥ������ 1�� �׷��� *50
figure(21); imagesc(Noise); colormap gray; colorbar;

Inoise=uint8(double(I)+Noise); % -������ ���ü��� ���� --> uint,, double�� ������ ���������
figure(22); imshow(Inoise);

%%noise sequence
N=100; % number of frames(images) %n�� ��������� �����ٲ��� %N Ŭ���� ���� ������ ���� ���� %�������Ҷ�
L=50; % noise level
gray= double(repmat(I,[1 1 N])); %repeat matrix %���� ���� ���η� N�� �ݺ� %���� double�� �ؾ� ��� ����
%size(gray)
noise=L*randn(size(gray)); %noise sequence
grayNoise=uint8(gray+noise);

%noise removal by sample mean
grayNoiseRemoval=uint8(mean(grayNoise,3)); %3��° channel�θ� �Ѹ�??
figure(23); imshow(grayNoiseRemoval);
title('Noise removed');


