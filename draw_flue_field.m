%画流场图
A=dlmread('velocity_radius');
[l, n]=size(A);
B=A(l/2+1:l,2:4);
B(:,4)=0
quiver(B(:,2),B(:,1),B(:,4),B(:,3),3)
%axis equal tight

for i=1:l/2
    x=B(i,1);
    y=B(i,2);
    u=B(i,3);
    v=B(i,4);
    U(x+1,y+1)=u;
    V(x+1,y+1)=v;
    
end

%streamslice(U,V);
axis equal tight