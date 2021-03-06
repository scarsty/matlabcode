function F = F110(D)

global N T

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

a1=4.124e5*(T-388);
aa=2*a1;
res=zeros(1,14);
k=1;
i1=2;

   
    if i1==1        
        bb=4*a11;
        cc=6*a111;
        dd=8*a1111;
    end
    if i1==2
        bb=2*a11+a12;
        cc=3*(a111+a112)/2;
        dd=a1111+a1112+a1122/2;
    end
    if i1==3
        bb=4*(a11+a12)/3;
        cc=2*(3*a111+6*a112+a123)/9;
        dd=8*(a1111+2*a1112+a1122+a1123)/27;
    end
    
    
lam=100*N/(1+100*N);
A=1/(eps0*100);

F=lam*A*D^2/2+(1-lam)*(aa/2*D^2+bb/4*D^4+cc/6*D^6+dd/8*D^8);