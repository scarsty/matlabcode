t=0:0.01:6.2;
p=4;
q=3;
x=cos(q*t).*(3+cos(p*t));
y=sin(q*t).*(3+cos(p*t));
z=sin(p*t);
plot3(x,y,z,'o')
axis equal