Ic=imread('../image/bts.jpg');
figure(1); imshow(Ic);
I=rgb2gray(Ic); %gray=(r+g+b)/3
figure(2); imshow(I);

w=ones(13,13)/(13*13);
G=imfilter(I,w,0); %image padding -> 0
figure(3); imshow(G); title('Filtered');

G2=imfilter(I,w,'symmetric'); %image padding -> replicate padding
figure(4); imshow(G2); title('Filtered2');

%% add noise

n=30*randn(size(I));
figure; imagesc(n);
colormap gray; colorbar;

hist(n(:)); % 1���� vector
hist(n(:),200); % bin ���� �۾Ƽ� ���� �־���
std(n(:)) % ������ ���� ǥ������(std)
mean(n(:)) % ������ ���

in=uint8(double(I)+n); %������ ������ ���� �� �޾Ƽ� uint8 ���� 0���ϴ� 0���� ������
 %uint8(I)�̶� �� �¾Ƽ� �ٲ���
figure(3); imshow(in); title('Noisy image');

%% averaging filter
w=ones(5,5)/(5*5); % ���� ���� ���� �� ��������
G=imfilter(I,w,'replicate','same'); %image padding�ϰ� ��ȿ�� ��(padding �κ�) ���ְ� ������ 'same'
figure(4); imshow(G); title('Averaged Image');

w=[-1 0 1,
    -1 0 1,
    -1 0 1]; 
G=imfilter(I,w,'replicate','same'); 
figure(4); imshow(G); title('Filtered');

w=rand(3,3);  %����� rand
G=imfilter(I,w,'replicate','same'); 
figure(4); imshow(G); title('Filtered');

w=randn(3,3);  %������ rand
G=imfilter(I,w,'replicate','same'); 
figure(4); imshow(G); title('Filtered');