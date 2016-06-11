%fft测试

[m n]=size(A);
N=1000;
R=zeros(N,2);
R(:,1)=1e7:1e7:1e7*N;
i=sqrt(-1);

for i1=1:m
    for i2=1:N
        R(i2,2)=R(i2,2)+exp(-i*pi*2*A(i1,1)*1e-9*i2*1e7)*A(i1,2);
    end
end