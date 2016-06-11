s=0;
for i=1:61108
    s=s+log10(i);
end
s;

A=hilb(5);
b=[1;0;0;0;0];
err=1e8;
lambda0=0;
while err>1e-16
    b=A*b;
    lambda=max(b)
    b=b/lambda;
    err=abs(lambda-lambda0);
    lambda0=lambda;
end
max(eig(A))