A=dlmread('coordinate_velocity');
[l, n]=size(A);
B=A(l/2+1:l,2:5);
quiver(B(:,2),B(:,1),B(:,4),B(:,3))
axis equal tight

for i=1:l/2
    x=B(i,1);
    y=B(i,2);
    u=B(i,3);
    v=B(i,4);
    U(x+1,y+1)=u;
    V(x+1,y+1)=v;
    
end

k=0;
s=zeros(79,1);
for i=1:1185
    a = B(i,2)+1;
    if ~isnan(B(i,4))
        s(a,1)=s(a,1)+B(i,4)*abs(B(i,1)-8);
    end
end

%plot(s);
%streamslice(U,V);
%axis equal tight