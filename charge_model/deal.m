% This program file is used to deal with datas
% You can modify this file to obtain what you need

clear
hold on
% i is used to count
i=1;

% Conditions
for R=[10]
for sigma=[1]
for N0=[5]
for T=350
    
    R_s=num2str(R);
    sigma_s=num2str(sigma);
    N0_s=num2str(N0);
    T_s=num2str(T);
    
    s=[R_s '_' sigma_s '_' N0_s 'e23_' T_s];
    A1=load(['.\datafiles\list_' s '_1.txt']);
    if exist(['.\datafiles\avge_' s '_2.txt'])~=0
        B1=load(['.\datafiles\avge_' s '_2.txt']);

%     B2=load(['.\datafiles\avge_' s '_2.txt']);
    
    
%     A2=load([s '_1u1.txt']);
%     B2=load([s '_2u1.txt']);
    
    % Here add what you want to do, the example is to get eps-T curve
    % You can see the result in the Workspace of MATLAB
%     D
    
    T1(i)=T;
    R1(i)=R;
%     D2(i)=B2(1);
%     Dx(i)=abs(A1(3840,3));
%     D1(i,j)=B1(1);
    eps(i)=B1(5);
    G1(i)=B1(4);
%     G2(i)=B2(4);
%     ss(i)=B1(6);
%     
%     T2(i)=T;
    eps2(i)=B1(6);
%     G2(i)=B2(4);
i=i+1;
    end
%     plot(A1(:,1),A1(:,2),'r')
%     axis([0 2 -1 1.5]);
    
end
end
end
end
% ee=(eps+2*eps2)/3;
% tt=[eps' eps2' G1'];
% plot(A1(:,1),A1(:,2),'color',[1-(T-390)/20,.4,(T-390)/20])
plot(A1(:,1),A1(:,5)*100000,'b',A1(:,1),A1(:,7),'g')
%     axis([0 2 -20 140]);

