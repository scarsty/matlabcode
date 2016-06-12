
% The data list
s=[R_s '_' sigma_s '_' N0_s 'e23_' T_s];

if needcurve==1 
    [x D Dx Dxx E P N GG GG1 GG2 GG3]=posteval(fem,'x','D','Dx','diff(Dx,x)','eps0/P0*(k*T*P0/R/R)*diff(Dx,x)/(q*P0/R*Dx+z*N0*q*q)',...
        'D-eps0/P0*(k*T*P0/R/R)*diff(Dx,x)/(q*P0/R*Dx+z*N0*q*q)','1+(q*P0/R)/z/N0/q/q*Dx','1/2*aa*P0*D^2+1/4*bb*P0^3*D^4+1/6*cc*P0^5*D^6+1/8*dd*P0^7*D^8+1/2*ff*P0/R/R*Dx^2-k*T*P0/R/R*diff(Dx,x)*D/(q*P0/R*Dx+z*N0*q*q)',...
        '1/2*aa*P0*D^2+1/4*bb*P0^3*D^4+1/6*cc*P0^5*D^6+1/8*dd*P0^7*D^8','1/2*ff*P0/R/R*Dx^2','-k*T*P0/R/R*diff(Dx,x)*D/(q*P0/R*Dx+z*N0*q*q)');
    dlmwrite(['.\datafiles\list_' s '_' num2str(ori(i1)*10+j) '.txt'],[x.d' D.d' Dx.d' Dxx.d' E.d' P.d' N.d' GG.d' GG1.d' GG2.d' GG3.d'],char(9));
end
% The average data
% If the solution is bipolar, only half region is needed
if j==1 
    zone=1;
else
    zone=2;
end

if j==1 
    avgD=postint(fem,'abs(D)','dl',[1])/1;
    avgE=postint(fem,'abs(eps0/P0*(k*T*P0/R/R)*diff(Dx,x)/(q*P0/R*Dx+z*N0*q*q))','dl',[1])/1;
    avgP=postint(fem,'abs(D-eps0/P0*(k*T*P0/R/R)*diff(Dx,x)/(q*P0/R*Dx+z*N0*q*q))','dl',[1])/1;
else
    avgD=postint(fem,'D','dl',[1])/2;
    avgE=postint(fem,'eps0/P0*(k*T*P0/R/R)*diff(Dx,x)/(q*P0/R*Dx+z*N0*q*q)','dl',[1])/2;
    avgP=postint(fem,'D-eps0/P0*(k*T*P0/R/R)*diff(Dx,x)/(q*P0/R*Dx+z*N0*q*q)','dl',[1])/2;
end

if j==1
    G=postint(fem,'1/2*aa*P0*D^2+1/4*bb*P0^3*D^4+1/6*cc*P0^5*D^6+1/8*dd*P0^7*D^8+1/2*ff*P0/R/R*Dx^2-k*T*P0/R/R*diff(Dx,x)*D/(q*P0/R*Dx+z*N0*q*q)','dl',[1])/1;
else
    G=postint(fem,'1/2*aa*P0*D^2+1/4*bb*P0^3*D^4+1/6*cc*P0^5*D^6+1/8*dd*P0^7*D^8+1/2*ff*P0/R/R*Dx^2-k*T*P0/R/R*diff(Dx,x)*D/(q*P0/R*Dx+z*N0*q*q)','dl',[1])/2;
end

if i1==1
    reps1=postint(fem,'eps0*(aa+3*bb*P0^2*D^2+5*cc*P0^4*D^4+7*dd*P0^6*D^6)','dl',[1])/zone;
    reps2=postint(fem,'eps0*(aa+2*a12*P0^2*D^2+2*a112*P0^4*D^4+2*a1112*P0^6*D^6)','dl',[1])/zone;
    reps3=reps2;
end
if i1==2
    reps1=postint(fem,'eps0*(3*a12*P0^2*D^2+7/2*a1122*P0^6*D^6+aa+15/2*a111*P0^4*D^4+15/2*a112*P0^4*D^4+7*a1111*P0^6*D^6+7*a1112*P0^6*D^6+6*a11*P0^2*D^2)','dl',[1])/zone;
    reps2=postint(fem,'eps0*(aa+2*a12*P0^2*D^2+a112*P0^4*D^4+1/2*a123*P0^4*D^4+1/2*a1112*P0^6*D^6+1/2*a1123*P0^6*D^6)','dl',[1])/zone;
    reps3=postint(fem,'eps0*(-a12*P0^2*D^2-1/2*a1122*P0^6*D^6+aa+15/2*a111*P0^4*D^4-1/2*a112*P0^4*D^4+7*a1111*P0^6*D^6+a1112*P0^6*D^6+6*a11*P0^2*D^2)','dl',[1])/zone;
end
if i1==3
    reps1=postint(fem,'eps0*(56/27*a1122*P0^6*D^6+4*a12*P0^2*D^2+10/9*a123*P0^4*D^4+aa+10/3*a111*P0^4*D^4+20/3*a112*P0^4*D^4+56/27*a1111*P0^6*D^6+112/27*a1112*P0^6*D^6+4*a11*P0^2*D^2+56/27*a1123*P0^6*D^6)','dl',[1])/zone;
    reps2=postint(fem,'eps0*(8/27*a1122*P0^6*D^6+aa-2/9*a123*P0^4*D^4+10/3*a111*P0^4*D^4+4/3*a112*P0^4*D^4+56/27*a1111*P0^6*D^6+40/27*a1112*P0^6*D^6+4*a11*P0^2*D^2-4/27*a1123*P0^6*D^6)','dl',[1])/zone;
    reps3=reps2;
end

if abs(imag(avgD))<1e-7
    avgD=real(avgD);
end
if abs(imag(avgE))<1e-7
    avgE=real(avgE);
end
if abs(imag(avgP))<1e-7
    avgP=real(avgP);
end
if abs(imag(G))<1e-7
    G=real(G);
end
if abs(imag(reps1))<1e-7
    reps1=real(reps1);
end
if abs(imag(reps2))<1e-7
    reps2=real(reps2);
end
if abs(imag(reps3))<1e-7
    reps3=real(reps3);
end


