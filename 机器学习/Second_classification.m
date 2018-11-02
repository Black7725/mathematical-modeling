%% ֧��������ģ��
clc,clear,close all
load fisheriris % �������ݼ���fisheriris��Matlab�Դ������ݼ�
%fisheriris��������Ϊ3�࣬setosa��versicolor��virginica.ÿ��ֲ����50����������150����

% ��ȡ���ݼ��е��������࡮versicolor' �� 'virginica'
inds = ~strcmp(species,'setosa'); % ����������ǩ������setosa����������Ϊ0���������(versicolor��virginica)�������Ϊ1
% ʹ������ά�ȣ��������к͵��������ݡ�
X = meas(inds,3:4); % ��meas���ݾ����У�ǰ50�������Ƴ�����100�������Ƴ����������������е�����
y = species(inds); % �Ƴ�ǰ50�е����࣬������50�е����ࡣ
tabulate(y) % tabulate()����ͳ����ֵ�ĸ�����Ƶ��

%% ʹ�����Ժ˺���ѵ��SVMģ�ͣ�����������ӻ�
SVMModel = fitcsvm(X,y,'KernelFunction','linear'); % KernelFunction���˺���
% �鿴�������ݻ��ֵ�֧������
sv = SVMModel.SupportVectors;
figure
gscatter(X(:,1),X(:,2),y) % gscatter�������԰���������������ɢ�㣬�����ڻ����������ɢ�����ֲ�ͼ��
hold on
plot(sv(:,1),sv(:,2),'ko','MarkerSize',10) % ����ԲȦ��С
legend('versicolor','virginica','Support Vector') % ͼ��
hold off

