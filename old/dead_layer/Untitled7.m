        
i=1;
for T=0:500
    N=0.001;
Ds100(i)=fminsearch(@F100,0.2);

T1(i)=T;
i=i+1;
end

plot(T1,Ds100)