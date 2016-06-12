% The data list
[x D Dx Dxx E P N]=posteval(fem,'x','D','Dx','diff(Dx,x)','eps0/P0*(k*T*P0/R/R)*diff(Dx,x)/(q*P0/R*Dx+z*N0*q*q)',...
    'D-eps0/P0*(k*T*P0/R/R)*diff(Dx,x)/(q*P0/R*Dx+z*N0*q*q)','1+(q*P0/R)/z/N0/q/q*Dx');

% The average data
% If the solution is bipolar, only half region is needed
if j==1 
    avgD=postint(fem,'abs(D)','dl',[1])/2;
    avgE=postint(fem,'abs(eps0/P0*(k*T*P0/R/R)*diff(Dx,x)/(q*P0/R*Dx+z*N0*q*q))','dl',[1])/2;
    avgP=postint(fem,'abs(D-eps0/P0*(k*T*P0/R/R)*diff(Dx,x)/(q*P0/R*Dx+z*N0*q*q))','dl',[1])/2;
else
    avgD=postint(fem,'abs(D)','dl',[1])/2;
    avgE=postint(fem,'eps0/P0*(k*T*P0/R/R)*diff(Dx,x)/(q*P0/R*Dx+z*N0*q*q)','dl',[1])/2;
    avgP=postint(fem,'D-eps0/P0*(k*T*P0/R/R)*diff(Dx,x)/(q*P0/R*Dx+z*N0*q*q)','dl',[1])/2;
end


G=postint(fem,'1/2*aa*P0*D^2+1/4*bb*P0^3*D^4+1/6*cc*P0^5*D^6+1/8*dd*P0^7*D^8+1/2*ff*P0/R/R*Dx^2-k*T*P0/R/R*diff(Dx,x)*D/(q*P0/R*Dx+z*N0*q*q)','dl',[1])/2;
reps1=postint(fem,'eps0/P0*(aa*P0+3*bb*P0^3*D^2+5*cc*P0^5*D^4+7*dd*P0^7*D^6)','dl',[1])/2;
reps2=postint(fem,'eps0/P0*(aa*P0+2*a12*P0^3*D^2+2*a112*P0^5*D^4+2*a1112*P0^7*D^6)','dl',[1])/2;

% Export data to file
s=[R_s '_' sigma_s '_' N0_s 'e23_' T_s];

format long
% If j=1, it means bipolar solution, or it is unipolar
dlmwrite(['.\datafiles\list_' s '_' num2str(j) '.txt'],[x.d' D.d' Dx.d' Dxx.d' E.d' P.d' N.d'],char(9));
dlmwrite(['.\datafiles\avge_' s '_' num2str(j) '.txt'],[avgD avgE avgP G 1/reps1 1/reps2 stop],char(9));