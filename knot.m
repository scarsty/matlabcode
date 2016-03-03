t=(-4:0.01:4)';
%x=t.^3-3*t;
%y=t.^4-4*t;
%z=t.^5/5-2*t;
[m n]=size(t);
x=zeros(m,3);
x(:,1)=2/5*t.*(t.^2-7).*(t.^2-10);
x(:,2)=t.^4-13*t.^2;
x(:,3)=1/10*t.*(t.^2-4).*(t.^2-9).*(t.^2-12);

s=0;
for i=1:m-1
    s=s+norm(x(i,:)-x(i+1,:));
end
l=s/50

xp=zeros(50,3);
k=1;
s=0;
for i=1:m-1
    s=s+norm(x(i,:)-x(i+1,:));
    if s>=l*k
        xp(k,:)=x(i,:);
        k=k+1;
    end
end

plot3(x(:,1),x(:,2),x(:,3),'o');
axis equal