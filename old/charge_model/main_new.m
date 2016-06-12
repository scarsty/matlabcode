% Coefficients, from Li's model
% a1=4.124e5*(T-388);

a11=-2.097e8;
a111=1.294e9;
a12=7.974e8;
a112=-1.95e9;
a123=-2.5e9;
a1111=3.863e10;
a1112=2.529e10;
a1122=1.637e10;
a1123=1.367e10;
P0=0.26;

needcurve=0;

kk=1.38e-23;
zz=2;
q=-1.602e-19;
ff=1.38e-11;

% Orient
ori=[100 110 111];

for R=[5 10 20 40 80 160] *1e-9
for sigma=[0.9] *P0
for N0=[5] *1e23
for T=[300:450]
tic

R_s=num2str(R/1e-9);
sigma_s=num2str(sigma/P0);
N0_s=num2str(N0/1e23);
T_s=num2str(T);

s=[R_s '_' sigma_s '_' N0_s 'e23_' T_s];
if 1%exist(['.\datafiles\avge_' s '.txt'])==0

a1=4.124e5*(T-388);
aa=num2str(2*a1);
res=zeros(1,13);
k=1;
pp=[1];
% if T>0 & T<=180
%     pp=3;
% end
% if T>180 & T<=220
%     pp=[3 2];
% end
% if T>220 & T<=260
%     pp=2;
% end
% if T>260 & T<=300
%     pp=[2 1];
% end
% if T>300 & T<=380
%     pp=[1 2 3];
% end
% if T>380
%     pp=[3 2 1];
% end
for i1=pp    
    if i1==1        
        bb=num2str(4*a11);
        cc=num2str(6*a111);
        dd=num2str(8*a1111);
    end
    if i1==2
        bb=num2str(2*a11+a12);
        cc=num2str(3*(a111+a112)/2);
        dd=num2str(a1111+a1112+a1122/2);
    end
    if i1==3
        bb=num2str(4*(a11+a12)/3);
        cc=num2str(2*(3*a111+6*a112+a123)/9);
        dd=num2str(8*(a1111+2*a1112+a1122+a1123)/27);
    end

    R_s=num2str(R/1e-9);
    sigma_s=num2str(sigma/P0);
    N0_s=num2str(N0/1e23);
    T_s=num2str(T);
    
    s=[aa '+0' bb '*x+0' cc '*x^2+0' dd '*x^3'];
    solsx=solve(s,'x');
    xx=sqrt(double(solsx));
    Ds=0;
    for i2=1:3
        if abs(imag(xx(i2)))<1e-10 & real(xx(i2)) > Ds
            Ds=real(xx(i2));
        end
    end
    epss=1/(str2num(aa)+3*str2num(bb)*Ds^2+5*str2num(cc)*Ds^4+7*str2num(dd)*Ds^6);
    N=zz*N0-sigma/q/R;
    j=1;
    [num2str(k) '. ' R_s 'nm, ' sigma_s 'Po, ' N0_s 'e23, ' T_s 'K, ' num2str(ori(i1)) ', ' num2str(j)]
    if sigma>Ds 
        A=sigma-Ds;
        z=sqrt(epss*(kk*T/N/q/q+ff));
        initial=['(' num2str(Ds) '+0' num2str(A) '*exp(-x*R/' num2str(z) ')-' num2str(Ds) '*exp((x*R-' num2str(R) ')/' num2str(z) '))/P0'];
        if real(z)==0
            initial='sigma/P0*(1-x)';
        end
        new_BT_8_b;
        post_new;
        res(k,:)=[k ori(i1) j Ds avgD avgE avgP G 1/reps1 1/reps2 1/reps3 stop 0];
        k=k+1;
    end
    
%     s=[aa '+0' bb '*x+0' cc '*x^2+0' dd '*x^3'];
%     xx=sqrt(double(solve(s,'x')));
    if sigma<Ds
        sigmas=num2str(sigma);
        s=[aa '/2*x^2+0' bb '/4*x^4+0' cc '/6*x^6+0' dd '/8*x^8-(0' aa '/2*(x-2*' sigmas ' )^2+0' bb '/4*(x-2*' sigmas ')^4+0' cc '/6*(x-2*' sigmas ')^6+0' dd '/8*(x-2*' sigmas ')^8)'];
        solsx=solve(s,'x');
        xx=double(solsx);
        
        rr=size(xx);
        
        D0=0;
        for i2=1:rr(1);
            if abs(imag(xx(i2)))<1e-10 & real(xx(i2)) > D0
                D0=real(xx(i2));
            end
        end
        
        for i2=1:3
            if abs(imag(xx(i2)))<1e-10;
                j=j+1;
                N=zz*N0-sigma/q/R;
                z=sqrt(epss*(kk*T/N/q/q+ff));
                A=D0-Ds;
                B=D0-2*sigma-Ds;
                initial=['(' num2str(Ds) '+0' num2str(A) '*exp(-x*R/' num2str(z) ')+0' num2str(B) '*exp((x*R-2*' num2str(R) ')/' num2str(z) '))/P0'];
                if real(z)==0 
                    initial=['sigma/P0*(1-x)+' num2str((D0-sigma)/P0)];
                end
            new_BT_8_u;
            post_new;
            res(k,:)=[k ori(i1) j Ds avgD avgE avgP G 1/reps1 1/reps2 1/reps3 stop 0];
            k=k+1;
        end
        end
    end
end

gg=max(res(:,8));
for i3=1:k-1
    if res(i3,9)>0
        if res(i3,8)<=gg
            gg=res(i3,8);
        end
    end
end

for i3=1:k-1
    if res(i3,9)>0 & res(i3,8)==gg
        res(i3,13)=1;
    end
end

s=[R_s '_' sigma_s '_' N0_s 'e23_' T_s];
dlmwrite(['.\datafiles\avge_' s '.txt'],res,char(9));

end


toc

end
end
end
end


