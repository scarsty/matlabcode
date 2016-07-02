hold on
sig=1;
c1=load(['5_' num2str(sig) '.txt']);
c2=load(['10_' num2str(sig) '.txt']);
c3=load(['20_' num2str(sig) '.txt']);
c4=load(['40_' num2str(sig) '.txt']);
c5=load(['80_' num2str(sig) '.txt']);
c6=load(['160_' num2str(sig) '.txt']);
i=1;
b1=(c1(:,2)+c1(:,4)+c1(:,5))/3;
b2=(c2(:,2)+c2(:,4)+c2(:,5))/3;
b3=(c3(:,2)+c3(:,4)+c3(:,5))/3;
b4=(c4(:,2)+c4(:,4)+c4(:,5))/3;
b5=(c5(:,2)+c5(:,4)+c5(:,5))/3;
b6=(c6(:,2)+c6(:,4)+c6(:,5))/3;

d1=3./(1./c1(:,2)+1./c1(:,4)+1./c1(:,5));
d2=3./(1./c2(:,2)+1./c2(:,4)+1./c2(:,5));
d3=3./(1./c3(:,2)+1./c3(:,4)+1./c3(:,5));
d4=3./(1./c4(:,2)+1./c4(:,4)+1./c4(:,5));
d5=3./(1./c5(:,2)+1./c5(:,4)+1./c5(:,5));
d6=3./(1./c6(:,2)+1./c6(:,4)+1./c6(:,5));
eps0=8.854e-12;
e1=exp((log(c1(:,2)*eps0)+log(c1(:,4)*eps0)+log(c1(:,5)*eps0))/3)/eps0;
e2=exp((log(c2(:,2)*eps0)+log(c2(:,4)*eps0)+log(c2(:,5)*eps0))/3)/eps0;
e3=exp((log(c3(:,2)*eps0)+log(c3(:,4)*eps0)+log(c3(:,5)*eps0))/3)/eps0;
e4=exp((log(c4(:,2)*eps0)+log(c4(:,4)*eps0)+log(c4(:,5)*eps0))/3)/eps0;
e5=exp((log(c5(:,2)*eps0)+log(c5(:,4)*eps0)+log(c5(:,5)*eps0))/3)/eps0;
e6=exp((log(c6(:,2)*eps0)+log(c6(:,4)*eps0)+log(c6(:,5)*eps0))/3)/eps0;

dlmwrite(['5_' num2str(sig) '.txt'], [c1 b1 d1 e1], char(9));
dlmwrite(['10_' num2str(sig) '.txt'], [c2 b2 d2 e2], char(9));
dlmwrite(['20_' num2str(sig) '.txt'], [c3 b3 d3 e3], char(9));
dlmwrite(['40_' num2str(sig) '.txt'], [c4 b4 d4 e4], char(9));
dlmwrite(['80_' num2str(sig) '.txt'], [c5 b5 d5 e5], char(9));
dlmwrite(['160_' num2str(sig) '.txt'], [c6 b6 d6 e6], char(9));

% plot(c1(:,1),c1(:,i),'-.r');
% plot(c2(:,1),c2(:,i),'-.','color',[0.87 0.49 0]);
% plot(c3(:,1),c3(:,i),'--','color',[0 0.5 0]);
% plot(c4(:,1),c4(:,i),'--','color',[0 0.75 0.75]);
% plot(c5(:,1),c5(:,i),'b');
% plot(c6(:,1),c6(:,i),'color',[0.75 0 0.75]);

% plot(c1(:,1),b1(:,i),'-.r');
% plot(c2(:,1),b2(:,i),'-.','color',[0.87 0.49 0]);
% plot(c3(:,1),b3(:,i),'--','color',[0 0.5 0]);
% plot(c4(:,1),b4(:,i),'--','color',[0 0.75 0.75]);
% plot(c5(:,1),b5(:,i),'b');
% plot(c6(:,1),b6(:,i),'color',[0.75 0 0.75]);
% 
% plot(c1(:,1),3./(1./c1(:,2)+1./c1(:,4)+1./c1(:,5)),'-.r');
% plot(c2(:,1),3./(1./c2(:,2)+1./c2(:,4)+1./c2(:,5)),'-.','color',[0.87 0.49 0]);
% plot(c3(:,1),3./(1./c3(:,2)+1./c3(:,4)+1./c3(:,5)),'--','color',[0 0.5 0]);
% plot(c4(:,1),3./(1./c4(:,2)+1./c4(:,4)+1./c4(:,5)),'--','color',[0 0.75 0.75]);
% plot(c5(:,1),3./(1./c5(:,2)+1./c5(:,4)+1./c5(:,5)),'b');
% plot(c6(:,1),3./(1./c6(:,2)+1./c6(:,4)+1./c6(:,5)),'color',[0.75 0 0.75]);

eps0=8.854e-12;
plot(c1(:,1),exp((log(c1(:,2)*eps0)+log(c1(:,4)*eps0)+log(c1(:,5)*eps0))/3)/eps0,'-.r');
plot(c2(:,1),exp((log(c2(:,2)*eps0)+log(c2(:,4)*eps0)+log(c2(:,5)*eps0))/3)/eps0,'-.','color',[0.87 0.49 0]);
plot(c3(:,1),exp((log(c3(:,2)*eps0)+log(c3(:,4)*eps0)+log(c3(:,5)*eps0))/3)/eps0,'--','color',[0 0.5 0]);
plot(c4(:,1),exp((log(c4(:,2)*eps0)+log(c4(:,4)*eps0)+log(c4(:,5)*eps0))/3)/eps0,'--','color',[0 0.75 0.75]);
plot(c5(:,1),exp((log(c5(:,2)*eps0)+log(c5(:,4)*eps0)+log(c5(:,5)*eps0))/3)/eps0,'b');
plot(c6(:,1),exp((log(c6(:,2)*eps0)+log(c6(:,4)*eps0)+log(c6(:,5)*eps0))/3)/eps0,'color',[0.75 0 0.75]);