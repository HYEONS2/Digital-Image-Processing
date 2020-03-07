function [histresult] = myhisteq(Img)

[ M, N ] = size(Img);
L=256; % 8bit
temp=Img; % Img ��� ����� Img������ temp����, 
            % ���߿� built-in hist����� �� Img data�� ���ļ� �ȳ����� ����

hst = zeros(L,1); % �ʱ�ȭ
for i=1:M % Input image�� �ִ��� ����
    for j=1:N
        hst(temp(i,j)+1) = hst(temp(i,j)+1) + 1; % ��ϰ��� ������׷��� ����
    end    % (0~255������ ũ���� histogram ĭ�� ��⿡ ���� ���� �ֱ�)
end
 
accumul = 0;
n = zeros(length(hst),1); % ��⿡ ���� ����
for i=1:length(hst)
    accumul = accumul + hst(i); % ����, �ñ׸� ni���
    n(i) = accumul;
end
 
Nnm = zeros(length(n),1); % �ʱ�ȭ
MN = M*N;
for i=1:length(n) % calculate histogram 
    Sk = n(i) * (L-1) / MN; % ni/MN = Pr
    Nnm(i) = round(Sk); % Nearest neighbor matching
end
 
histresult = Img; % ���� �Ҵ�
for i=1:M
    for j=1:N
        histresult(i,j) = Nnm(temp(i,j)+1);
    end
end
 
histresult = uint8(histresult);
end