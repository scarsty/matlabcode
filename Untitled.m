a=double(imread('1.bmp'));
[u,s,v]=svd(a);
r=zeros(size(a));
for i=1:30
    r=r+u(:,i)*s(i,i)*v(:,i)';
end
image(r);