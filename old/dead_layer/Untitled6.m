D=-0.5:0.01:0.5;
i=1;
T=391;
global N T
for d=D
    N=0.0;
F(i)=F100(d);
i=i+1;
end
plot(D,F)