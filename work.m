function work
 x=2.0:-0.4:-2.0;
u=[-853 -651 -448 -281 -126 0 174 357 558 763 977];
 p=polyfit(x,u,1);
 U=polyval(p,x);
 plot(x,U)
 hold on
 plot(x,u,'r')
 plot(x,u,'b*')
 legend('һ���������','ʵ����������','ʵ�����ݵ�');
 title('U=f(x)����һ�����');
 xlabel('xֵ(mm)');ylabel('Uֵ(mv)');
 text(-1.5,-300,'����ʽ��ϱ��ʽ��y=-441*x+42.7273  ������Ϊ��-441','fontsize',10);
 grid on;
 hold off
 

 

 