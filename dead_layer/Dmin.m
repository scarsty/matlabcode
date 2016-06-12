global N T
j=1;
for N=[1e-2];
    s=100*N/(1+100*N);
i=1;
for T=0:500
    
    Ds(1)=fminsearch(@F100,0.2);
    G(1)=F100(Ds(1));
    if G(1)>0
        Ds(1)=0;
        G(1)=F100(Ds(1));
    end
    Ds(2)=fminsearch(@F110,0);
    G(2)=F110(Ds(2));
    Ds(3)=fminsearch(@F111,0);
    G(3)=F111(Ds(3));
    
    [c p]=min(G);
%     if c==0 
%         p(j,i)=0;
%     end
%     if p(j,i)==1 plot(T,N,'r');end
%     if p(j,i)==2 plot(T,N,'g');end
%     if p(j,i)==3 plot(T,N,'b');end
%     if p(j,i)==0 plot(T,N,'o');end
%     
    D_2(i)=(1-s)^2*Ds(p);
    T1(i)=T;
    i=i+1;
end
j=j+1;
end
plot(T1,D1)