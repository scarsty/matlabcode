% This program file is used to deal with datas
% You can modify this file to obtain what you need

clear
hold on
% i is used to count
i=1;

% Conditions
for R=[5 10 20 40 80 160]
    i=1;
    j=1;
for sigma=[0.9]
for N0=[5]
for T=[300:450]
%     for ps=[100 110 111]
    
    R_s=num2str(R);
    sigma_s=num2str(sigma);
    N0_s=num2str(N0);
    T_s=num2str(T);
    
    s=[R_s '_' sigma_s '_' N0_s 'e23_' T_s];
    if exist(['.\datafiles\avge_' s '.txt'])~=0
        A1=load(['.\datafiles\avge_' s '.txt']);
%         Ds110=0/0.26;Ds100=0/0.26;Ds111=0/0.26;
%         B1=load(['.\datafiles\list_' s '_1001.txt']);
%         plot(B1(:,1),B1(:,2));
%         plot(B1(:,1),-(B1(:,2)-Ds100).*B1(:,5)/8.854e-12*0.26+B1(:,9)+B1(:,10),'r')
%         plot(2-B1(:,1),-B1(:,2))
%         B2=load(['.\datafiles\list_' s '_1101.txt']);
%         plot(B2(:,1),B2(:,8))
%         plot(B2(:,1),-(B2(:,2)-Ds110).*B2(:,5)/8.854e-12*0.26+B2(:,9)+B2(:,10),'g')
%         plot(2-B2(:,1),-B2(:,2))
%         B3=load(['.\datafiles\list_' s '_1111.txt']);
%         plot(B3(:,1),B3(:,5)*1e5)
%         plot(B3(:,1),-(B3(:,2)-Ds111).*B3(:,5)/8.854e-12*0.26+B3(:,9)+B3(:,10),'b')
    rr=size(A1);
%     Ds=0;
    cc=1;
    for k=1:rr(1)
        if A1(k,13)==1;
            cc=k;
%             Ds=B1(k,4);
        end
    end
% %     
    T1(i)=T;
    eps1(i)=A1(cc,9);
    eps2(i)=A1(cc,10);
    ph(i)=A1(cc,2);
%     if ph(i)==110;
%         T2(j)=T;
        eps3(i)=A1(cc,11);
%         j=j+1;
%     end

    D1(i)=A1(cc,5)/A1(cc,3);
    P1(i)=A1(cc,7);
    G1(i)=A1(cc,8);    
    
%     uorb=A1(cc,3);
%     if ph(i)==100
%         plot(T,sigma,'.r');
%     end
%     if ph(i)==110
%         plot(T,sigma,'.g');
%     end
%     if ph(i)==111
%         plot(T,sigma,'.b');
%     end
%     if uorb==1
%         plot(T,sigma);
%     end
%     if ps==100 
%         plot(B1(:,2),B1(:,8),'r')
%     end
%     if ps==110 
%         plot(B2(:,1),B2(:,9),'r')
%         plot(B2(:,1),B2(:,10),'g')
%         plot(B2(:,2),B2(:,8),'g')
%     end
%     if ps==111 
%         plot(B3(:,1),B3(:,90),'--r')
%         plot(B3(:,1),B3(:,10),'--g')
%         plot(B3(:,2),B3(:,8),'b')
%     end

%     if B1(cc,10)<0
%         plot(T,sigma,'color',[0 0 0])
%     end
    sym(i)=A1(cc,3);
    st(i)=sum(A1(:,12));
%     p(i)=rr(1);
% %     if B1(cc,12)==0
%         if st(i)==0
            i=i+1;
%         end
%     end
    end
%     end
    
end
end
end
plot(T1,D1,'r')
dlmwrite([num2str(R) '_' num2str(sigma) '.txt'],[T1', eps1', D1', eps2', eps3', P1', G1'])
% plot(T1,ph*20)
end
% tt=[T1' eps1' eps2' eps3' G1' ph' sym' st'];
% plot(T1,(eps1+eps2+eps3)/3,'.');
% % plot(T1,eps1,'.r',T1,eps2,'.b',T1,eps3,'.g');
%  axis([0 500 0 2]);
% plot(T1,eps1,'r')
% plot(T1,st*1000)
% plot(T1,DD,'r')