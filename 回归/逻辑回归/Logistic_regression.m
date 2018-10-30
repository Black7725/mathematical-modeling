% logistic�ع�

%% ��������
clc,clear,close all
X0 = xlsread('logistic_ex1.xlsx','A2:C21'); % ǰ20����ҵ����������ָ��ֵ,���ع�ģ�͵�����
Y0 = xlsread('logistic_ex1.xlsx','D2:D21'); % ǰ20����ҵ��������������ع�ģ�͵����
X1 = xlsread('logistic_ex1.xlsx','A2:C26'); % Ԥ����������

%% �߼�����
GM = fitglm(X0,Y0,'Distribution','binomial');
Y1 = predict(GM,X1);

%% ģ�͵�����
N0 = 1:size(Y0,1); % N0 = [1,2,3,4,������20]
N1 = 1:size(Y1,1); % N1 = [1,2,3,4,������25]
plot(N0',Y0,'-kd'); % N0'ָ���Ƕ�N0'����ת�ã�N0'��Y0����ʽ��ͬ�����д�����Ƶ���ǰ20����ҵ���������
% plot()�еĲ���'-kd'�Ľ�����-����ֱ�ߣ�k�����ɫ��d�������η���
hold on;
scatter(N1',Y1,'b'); % N1'ָ���Ƕ�N1'����ת�ã�N1'��Y1����ʽ��ͬ
xlabel('��ҵ���');
ylabel('���ֵ');


