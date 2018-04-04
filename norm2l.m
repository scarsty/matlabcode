A=[0 3 6;1 4 7;2 5 8]

for i=1:1

X=zeros(1,3);
X(1)=norm(A(:,1));
X(2)=norm(A(:,2));
X(3)=norm(A(:,3));
X
R=[1,1,1];


dX=(X-R);
XX=dX./X;
XXX=[1;1;1]*XX;
dA=A.*XXX

A=A-dA*1;
end