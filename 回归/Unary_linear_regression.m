%% ��������
clc, clear, close all
% ְ�������ܶ�
x = [23.8,27.6,31.6,32.4,33.7,34.90,43.2,52.8,63.8,73.4];
% ��Ʒ�����ܶ�
y = [41.4,51.8,61.7,67.9,68.7,77.5,95.9,137.4,155.0,175.0];

%% ������С���˷��ع�
% ��ɢ��ͼ
figure
plot(x,y,'r*') % ɢ��ͼ��ɢ��Ϊ��ɫ
xlabel('x(ְ�������ܶ�)','fontsize',12)
ylabel('y(��Ʒ�����ܶ�)','fontsize',12)
set(gca, 'linewidth',2) % �������߿�Ϊ2

% ������С���˷����
Lxx = sum((x-mean(x)).^2); %���б������У�^��.^��ͬ
Lxy = sum((x-mean(x)).*(y-mean(y)));
b1 = Lxy/Lxx;
b0 = mean(y) - b1 * mean(x);
y1 = b1 * x + b0;

hold on % hold on�ǵ�ǰ�ἰͼ�񱣳ֶ�����ˢ�£�׼�����ܴ˺󽫻��Ƶ�ͼ�Σ���ͼ����
plot(x,y1, 'linewidth',2);

%% ���� LinearModel.fit �����������Իع�
m2 = LinearModel.fit(x, y)

%% ���� regress �������лع�
Y = y'
X = [ones(size(x,2),1),x']
[b,bint,r,rint,s] = regress(Y,X)


