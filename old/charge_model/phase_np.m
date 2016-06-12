clear

R_=20;
N0=5e23;
R_s=num2str(R_);
N0_s=num2str(N0/1e23);
T=250;
sigma_=0.0;
n=1;
pL=1;pR=-1;
pp=3;
Ds=2;

needcurve=0;
ori=[100;110;111];
P0=0.26;
a11=-2.097e8;
a111=1.294e9;
a12=7.974e8;
a112=-1.95e9;
a123=-2.5e9;
a1111=3.863e10;
a1112=2.529e10;
a1122=1.637e10;
a1123=1.367e10;

kk=1.38e-23;
zz=2;
q=-1.602e-19;
ff=1.38e-11;

R=R_*1e-9;
while sigma_<2.02 & T<500 & sigma_>-0.02 & T>0
    sigma_=sigma_+0.02;
    sigma=sigma_*P0;
    tic
    ph1=0;ph2=0;
    while ~(ph1==pL & ph2==pR) & T<500 & T>0
        [num2str(T) ', ' num2str(sigma_)]
        sigma_s=num2str(sigma_);
        T_s=num2str(T);
        
        s=[R_s '_' sigma_s '_' N0_s 'e23_' T_s];
        if exist(['.\datafiles\avge_' s '_' num2str(ori(pp)) '.txt'])==0
            ph_np;
        end
        B1=load(['.\datafiles\avge_' s '_' num2str(ori(pp)) '.txt']);
        T=T+1;
        T_s=num2str(T);
        s=[R_s '_' sigma_s '_' N0_s 'e23_' T_s];
        if exist(['.\datafiles\avge_' s '_' num2str(ori(pp)) '.txt'])==0
            ph_np;
        end
        B2=load(['.\datafiles\avge_' s '_' num2str(ori(pp)) '.txt']);
        T=T-1;
        
        if B1(1,9)>0 & B1(1,10)>0 & B1(1,11)>0
            ph1=1;
        else
            ph1=-1;
        end
            
        if B2(1,9)>0 & B2(1,10)>0 & B2(1,11)>0
            ph2=1;
        else
            ph2=-1;
        end
       
        Tp=T;
        if ph1==pR
            T=T-1;
        end
        if ph2==pL
            T=T+1;
        end
        if Tp==T
            break;
            ['Skip!!']
        end
    end
    TT(n)=T;
    ss(n)=sigma_;
    n=n+1;
    toc
end
