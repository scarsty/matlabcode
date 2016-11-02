% find A which make ||A*B0 hadamard B1|| max
B0=double(imread('pcb0.bmp'))*1.0/255;
B1=double(imread('pcbb.bmp'))*1.0/255;

[n m] = size(B0);

A = zeros(n,n);
l=25;

for i=13:n-l+1
    b0=max(1,i-100);
    b1=min(n,b0+100);
    C=conv2(B0(b0:b1,:),B1(i-12:i+12,:),'valid');
    c=max(C);
    index = find(C==c);
    
    i0=max(1,index-12);
    i1=min(77,index+12);
    A(i,i-12+i0:i-12+i1) = A(i,i-12+i0:i-12+i1)+C(i0:i1).';
end

for i=1:n
    A(i,:)=A(i,:)/sum(A(i,:));
end

