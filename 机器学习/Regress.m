%% �жϲ�ͬ���ء����䡢�Ա���˵����̸���
clc,clear,close all
load hospital % ����hospital���ݼ�

dsa = hospital;

% ָ��ģ��ʹ�õļ��㹫ʽ
% ��ʽ����д��ʽ���� Wilkinson Notation, ������鿴��
% http://cn.mathworks.com/help/stats/wilkinson-notation.html
modelspec = 'Smoker ~ 1+ Age + Weight + Sex + Age:Weight + Age:Sex + Weight:Sex';
% ͨ������'Disribution'ָ��'binomial'�����߼��ع�ģ��
mdl = fitglm(dsa, modelspec, 'Distribution', 'binomial')
