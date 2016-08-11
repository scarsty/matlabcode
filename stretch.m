%t1=double(imread('t1.bmp'))/255;

t0=double(imread('t0.bmp'))/255;%standard image
t1d=double(imread('t1d.bmp'))/255;%deformed image with other info

%find
diffm = 10;
[m0,n0] = size(t0);
M_t0 = m0*n0;
%transfer t0 to vector b
b=t0(:);
tic
[m1,n1] = size(t1d);
n=n0;
N = m1*n1*(diffm*2+1);
ii=zeros(N,1);
jj=zeros(N,1);
ss=zeros(N,1);
count=0;
for i0=1:m0
    i1 = int32(i0*m1/m0);
    for j=1:n
        for k=-diffm:diffm
            id=i1+k;
            if id>=1 && id<=m1
                count=count+1;
                ii(count)=i0+(j-1)*m0;
                jj(count)=id+(i0-1)*m1;
                ss(count)=t1d(id,j);
            end
        end
    end
end
toc
X_SP=sparse(ii(1:count),jj(1:count),ss(1:count),m0*n,m0*m1);
toc
a=X_SP\b;
toc
A=zeros(m0,m1);
for i0=1:m0
    for i1=1:m1
        %if abs(i1-i0)<=diffm
        A(i0,i1)=a(i1+(i0-1)*m1);
        %end
    end
end
for i0=1:m0
    s=sum(A(i0,:));
    if (s~=0)
        %A(i0,:)=A(i0,:)/abs(s);
    end
end
t0d=A*t1d;
imshow(t0d);