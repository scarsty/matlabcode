a11=-2.097e8;
a111=1.294e9;
a12=7.974e8;
a112=-1.95e9;
a123=-2.5e9;
a1111=3.863e10;
a1112=2.529e10;
a1122=1.637e10;
a1123=1.367e10;

eps0=8.8542e-12;
epsb=100;

% syms D1 D2 D3 F  
tic

global N T 
j=1;
for N=[1e-4];
lam=100*N/(1+100*N);
A=1/(eps0*100);

i=1;
for T=0:500 
    syms D1 D2 D3 F 
    a1=4.124e5*(T-388);
    F=lam*A/2*(D1^2+D2^2+D3^2)+(1-lam)*(...
        a1*(D1^2+D2^2+D3^2)+a11*(D1^4+D2^4+D3^4)+a12*(D1^2*D2^2+D2^2*D3^2+D3^2*D1^2)+a111*(D1^6+D2^6+D3^6)+...
        a112*(D1^4*(D2^2+D3^2)+D2^4*(D3^2+D1^2)+D3^4*(D1^2+D2^2))+a123*D1^2*D2^2*D3^2+...
        a1111*(D1^8+D2^8+D3^8)+a1112*(D1^6*(D2^2+D3^2)+D2^6*(D3^2+D1^2)+D3^6*(D1^2+D2^2))+...
        a1122*(D1^4*D2^4+D2^4*D3^4+D3^4*D1^4)+a1123*(D1^4*D2^2*D3^2+D2^4*D3^2*D1^2+D3^4*D1^2*D2^2));
%     J=jacobian(transpose(jacobian(F,[D1 D2 D3])),[D1 D2 D3]);
    J=jacobian(transpose(jacobian((F-lam*A/2*(D1^2+D2^2+D3^2))/(1-lam),[D1 D2 D3])),[D1 D2 D3]);
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
    if p==1
        D1=Ds(1);
        D2=0;
        D3=0;
        reps1=[1 0 0]*J*[1 0 0]';
        reps2=[0 1 0]*J*[0 1 0]';
        reps3=[0 0 1]*J*[0 0 1]';
    end
    if p==2
        D1=Ds(2)/sqrt(2); 
        D2=D1;
        D3=0;
        reps1=[1 1 0]*J*[1 1 0]'/2;
        reps2=[0 0 1]*J*[0 0 1]';
        reps3=[1 -1 0]*J*[1 -1 0]'/2;
    end
    if p==3
        D1=Ds(3)/sqrt(3); 
        D2=D1;
        D3=D1;
        reps1=[1 1 1]*J*[1 1 1]'/3;
        reps2=[1 -1 0]*J*[1 -1 0]'/2;
        reps3=[1 1 -2]*J*[1 1 -2]'/6;
    end
    
    eps1(i)=1/eval(reps1)/eps0;
    eps2(i)=1/eval(reps2)/eps0;
    eps3(i)=1/eval(reps3)/eps0;

%     
    DD(i)=Ds(p);
    T1(i)=T;
    i=i+1;
end
j=j+1;
end
hold on

s=lam;
eps1_=(1-s)^2./(s/epsb+(1-s)./eps1)+s*(2-s)*epsb;
eps2_=(1-s)^2./(s/epsb+(1-s)./eps2)+s*(2-s)*epsb;
eps3_=(1-s)^2./(s/epsb+(1-s)./eps3)+s*(2-s)*epsb;

plot(T1,eps2_,'g')
plot(T1,eps3_,'b')
plot(T1,eps1_,'r')
toc