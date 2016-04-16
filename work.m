function work
 x=2.0:-0.4:-2.0;
u=[-853 -651 -448 -281 -126 0 174 357 558 763 977];
 p=polyfit(x,u,1);
 U=polyval(p,x);
 plot(x,U)
 hold on
 plot(x,u,'r')
 plot(x,u,'b*')
 legend('一阶拟合曲线','实际数据曲线','实际数据点');
 title('U=f(x)数据一阶拟合');
 xlabel('x值(mm)');ylabel('U值(mv)');
 text(-1.5,-300,'多项式拟合表达式：y=-441*x+42.7273  灵敏度为：-441','fontsize',10);
 grid on;
 hold off
 

 

 