t1=double(imread('t1.bmp'))/255;
t0=double(imread('t0.bmp'))/255;
t1d=double(imread('t1d.bmp'))/255;
tic
%X=zeros(120000, 8000);
b=rand(120000,1);
toc
ii=zeros(400*300*20,1);
jj=zeros(400*300*20,1);
ss=zeros(400*300*20,1);
c=1;
for i=1:400
    for j=1:300
    for k=1:20
        %X(i+(j-1)*400,i+(k-1)*400)=rand();
        ii(c)=i+(j-1)*400;
        jj(c)=i+(k-1)*400;
        ss(c)=rand();
        c=c+1;
    end
    end
end
toc
%X_SP=sparse(X);
X_SP=sparse(ii,jj,ss,120000,8000);
toc
a=X_SP\b;
toc
