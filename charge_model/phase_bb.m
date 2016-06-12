clear

R_=5;
N0=5e23;
R_s=num2str(R_);
N0_s=num2str(N0/1e23);
T=398;
sigma_=0;
n=1;
pL=100;pR=111;
pp=[3 1];
Ds=2;

needcurve=0;

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
while sigma_<2.02 & T<500 & sigma_>-0.02
    sigma_=sigma_+0.02;
    sigma=sigma_*P0;
    tic
    ph1=1;ph2=1;
    while ~(ph1==pL & ph2==pR) & T<500
        [num2str(T) ', ' num2str(sigma_)]
        sigma_s=num2str(sigma_);
        T_s=num2str(T);
        
        s=[R_s '_' sigma_s '_' N0_s 'e23_' T_s];
        if exist(['.\datafiles\avge_' s '_' num2str(pL+pR) '.txt'])==0
            ph_bb;
        end
        B1=load(['.\datafiles\avge_' s '_' num2str(pL+pR) '.txt']);
        T=T+1;
        T_s=num2str(T);
        s=[R_s '_' sigma_s '_' N0_s 'e23_' T_s];
        if exist(['.\datafiles\avge_' s '_' num2str(pL+pR) '.txt'])==0
            ph_bb;
        end
        B2=load(['.\datafiles\avge_' s '_' num2str(pL+pR) '.txt']);
        T=T-1;
        
        rr=size(B1);
        for i=1:rr(1)
            if B1(i,13)==1
                cc1=i;
            end
        end
        rr=size(B2);
        for i=1:rr(1)
            if B2(i,13)==1
                cc2=i;
            end
        end
        
        ph1=B1(cc1,2);
        ph2=B2(cc2,2);
       
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
    st(n)=B1(cc1,12)+B2(cc2,12);
    n=n+1;
    toc
end
