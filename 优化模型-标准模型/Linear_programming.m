clc,clear,close all
%% ѡ���Ż�����������Թ滮������linprogʵ��

%% �����б����ϲ�Ϊһ����������16������
variables = {'I1','I2','HE1','HE2','LE1','LE2','C','BF1','BF2','HPS','MPS','LPS','P1','P2','PP','EP'}
N = length(variables)
for v = 1:N
    eval([variables{v},'=',num2str(v),';'])
end

%% ����������Լ��(lb<=x<=ub)
% ��������Լ������lb<=x
lb = zeros(size(variables)); % 1x16�ľ���ÿ��������0
lb([P1,P2,MPS,LPS]) = [2500,3000,271536,100623];
% ��������Լ������x<=ub
ub = Inf(size(variables)); % 1��6�ľ���ÿ�������������
ub([P1,P2,I1,I2,C,LE2])= [6250,9000,192000,244000,62000,142000];

%% �������Բ���ʽԼ��(A*x<=b)
A = zeros(3,16); % 3x16�ľ���ÿ������Ϊ0,Ϊʲô��3x16����ΪԼ��������3������ʽ
% �ɲ���ʽI1-HE1<=132000�õ�����һ�д���
A(1,I1)=1; A(1,HE1)=-1; b(1) = 132000;
% �ɲ���ʽ-EP-PP<=12000�õ�����һ�д���
A(2,EP)=-1; A(2,PP)=-1; b(2) = -12000;
% �ɲ���ʽ-P1-P2-PP<=-24550�õ�����һ�д���
A(3,[P1,P2,PP])=[-1,-1,-1];b(3)=-24550;

%% �������Ե�ʽԼ��(Aeq*x=beg)
Aeq=zeros(8,16);beq=zeros(8,1) % Լ�������й���8����ʽ
% �ѵ�ʽI2=LE2+HE2ת��ΪLE2+HE2-I2=0�󣬵õ�����һ�д���
Aeq(1,[LE2,HE2,I2])=[1,1,-1];
Aeq(2,[LE1,LE2,BF2,LPS])=[1,1,1,-1];
Aeq(3,[I1,I2,BF1,HPS])=[1,1,1,-1];
Aeq(4,[C,MPS,LPS,HPS])=[1,1,1,-1];
Aeq(5,[LE1,HE1,C,I1])=[1,1,1,-1];
Aeq(6,[HE1,HE2,BF1,BF2,MPS])=[1,1,1,-1,-1];
Aeq(7,[HE1,LE1,C,P1,I1])=[1267.8,1251.4,192,3413,-1359.8];
Aeq(8,[HE1,LE2,P2,I2])=[1267.8,1251.4,3413,-1359.8];

%% ����Ŀ�꺯��
f = zeros(size(variables));
% ��Ŀ�꺯��0.002614HPS+0.0239PP+0.009825EP
f([HPS,PP,EP]) = [0.002614,0.0239,0.009825];

%% ��linprogʵ�����Թ滮�������
options = optimoptions('linprog','Algorithm','dual-simplex');
% ��ǰ���Ѿ�ȷ���ĸ�����������linprog()��
[x, fval] = linprog(f,A,b,Aeq,beq,lb,ub,options);
for d=1:N
    fprintf('%12.2f\t%s\n',x(d),variables{d})
end