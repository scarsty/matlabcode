A=double(rgb2gray(imread('3.bmp')));

B=zeros(2, 2);

for i=1:10
    for j=1:10
        ii=i-5;
        jj=j-5;
        %kk=k-1;
        B(1,1)=B(1,1)+A(i,j)*jj^2;
        B(2,2)=B(2,2)+A(i,j)*ii^2;
        %B(3,3)=B(3,3)+A(i,j)*(ii^2+jj^2);
        B(1,2)=B(1,2)-A(i,j)*ii*jj;
    end
end
B(2,1)=B(1,2);
[lambda V] = eig(B);

W=zeros(9,9);

for i=1:9
    for j=1:9
        W(i,j)=(i-5)^2+(j-5)^2;
    end
end

R = conv2(A,W,'valid');

