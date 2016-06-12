% mainfit

x0 = [2e-5 240 0.8];
i=0;
resnorm=1;
f=1;
sec=257:512;
while resnorm>=1e-4 & i<100
    
    [x,resnorm] = lsqcurvefit(@fitpercolation,x0,y(sec,1),y(sec,3));
    f=abs(x(3)-x0(3));
    x0=x
    display(resnorm)
    i=i+1

end
