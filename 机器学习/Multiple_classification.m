%% ����fisheriris���ݼ�
clc,clear,close all
load fisheriris
X = meas;
Y = species;
tabulate(Y);

%% ����SVMģ�壨������ģ�ͣ������Է���������б�׼������
% predictors
t = templateSVM( 'Standardize' , 1); % �Է���������б�׼������

%% ����SVM������ģ�ͽ���ѵ�������ɶ����ģ��
Mdl = fitcecoc(X,Y,'Learners',t,...
    'ClassNames',{'setosa','versicolor','virginica'})
