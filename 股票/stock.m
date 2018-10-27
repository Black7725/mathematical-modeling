%% Ԥ���Ʊ�ļ�ֵ�����

%% ��������
clc, clear, close all
% clc���������ڵ����ݣ��Թ��������е�ȫ���������κ�Ӱ�� 
% clear����������ռ�����б��� 
% close all:�ر����е�Figure����

% ��������
[~, ~, raw] = xlsread('sz000004.xlsx', 'Sheet1', 'A2:H7');
% [num,txt,raw],~��ʾʡ�Ըò��ֵķ���ֵ
% xlsread('filename'��'sheet'�� 'range')���ڶ�������ָ������sheet1��������sheet���֣�range��ʾ��Ԫ��Χ

% �����������
data = reshape([raw{:}],size(raw));
% [raw{:}]ָraw����������ݣ�size(raw)��6 x 8 ��������6x8��cell��������ת��Ϊ6x8 double��������

% ���������������б�������
Date = data(:, 1); % ��һ��������ʾ�ӵ�һ�е����һ�У��ڶ���������ʾ��һ��
DateNum = data(:, 2);
Popen = data(:, 3);
Phigh = data(:, 4);
Plow = data(:, 5);
Pclose = data(:, 6);  
Volum = data(:, 7); % Volume ��ʾ��Ʊ�ɽ�������˼���ɽ���=�ɽ�����*�ɽ��۸� �ټ�Ȩ���
Turn = data(:, 8); % turn��ʾ��Ʊ��ת�ʣ���Ʊ��ת��Խ�ߣ���ζ�Ÿùɹ���Խ���ã�Ҳ����Ͷ������ν�����Ź�

% �����ʱ����data��raw
clearvars data raw;

%% ����̽��

figure % ����һ���µ�ͼ�񴰿�
plot(DateNum, Pclose, 'k'); % 'k',�����Ǻ�ɫ�ģ���ӡ��ʧ��
datetick('x','mm-dd'); % ����������ʾ����
xlabel('����') % x��
ylabel('���̼�') % y��
figure
bar(Pclose) % ��Ϊ����ͼ��

%% ��Ʊ��ֵ������

p = polyfit(DateNum, Pclose, 1); % ����ʽ���
% �ֺ�����Ϊ�����������ʾִ�н��
P1 = polyval(p,DateNum); % �õ�����ʽģ�͵Ľ��
figure
plot(DateNum,P1,DateNum,Pclose,'*g'); % ģ����ԭʼ���ݵĶ���
value = p(1) % ��б�ʸ�ֵ��value����Ϊ��Ʊ�ļ�ֵ��

 

%% ��Ʊ���յ�����

MaxDD = maxdrawdown(Pclose); % �������س�

risk = MaxDD  % �����س���ֵ��risk����Ϊ��Ʊ�ķ���