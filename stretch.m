%t1=double(imread('t1.bmp'))/255;

t0=double(imread('t0.bmp'))/255;%standard image
t1d=double(imread('t1d.bmp'))/255;%deformed image with other info

%find
diffm = 20;
[m0,n0] = size(t0);
M_t0 = m0*n0;
%transfer t0 to vector b
b=t0(:);

[m1,n1] = size(t1d);
N = m1*n1*(diffm*2+1);
ii=zeros(N,1);
jj=zeros(N,1);
ss=zeros(N,1);
count=0;
for i=1:m1
    for j=1:n1
        for k=-diffm:diffm
            id=i+k;
            if id>=1 && id<=m1
                count=count+1;
                %todo: unfinished, seems not right
                ii(count)=i+(j-1)*m1;
                jj(count)=i+(-1)*400;
                ss(count)=t1d(id,j);
            end
        end
    end
end

X_SP=sparse(ii(1:count),jj(1:count),ss(1:count),m1*n1,count);
% toc
% a=X_SP\b;
