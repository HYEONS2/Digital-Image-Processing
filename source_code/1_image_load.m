%load image
Ic=imread('../image/head.png');

%diplay image
figure(1), imshow(Ic);

%rgb ->gray conversion
f=rgb2gray(Ic);
figure(2), imshow(f);

%��ǥ�� rgb���󺸱�
f(1,1)

%image size
size(f)

%overlay a point symbol
figure(2); hold on;
plot(100,100,'r+','markersize',15);

%plot�� ���� X ���� %������ ���� X ����
plot(100,200,'y+','markersize',15); 