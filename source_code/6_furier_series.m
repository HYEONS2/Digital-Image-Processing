% furier series
t=0:0.01:2*pi*2;  %���ֱ� 2����Ŭ ������ 0.01 �������� t�� ����
y=sin(3*t)/3;
figure(1); plot(t,y);

y=sin(t)+sin(3*t)/3;
hold on;  plot(t,y)

%Ȧ�� ���ļ� ��� �߰�
y=sin(t)+sin(3*t)/3+sin(5*t)/5;
hold on;  plot(t,y);

figure(1); clf; %clf: clear current figure, hold on ���ִ� ��
y=zeros(size(t));
for i=1:2:19 % ���ļ��� ��� ���� ��Ű�鼭 Ȯ���ϴ� �κ�
    y=y+sin(i*t)/i;
    plot(t,y);
    pause(3);
end
