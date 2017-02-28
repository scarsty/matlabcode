
N=378;
f=zeros(N,4);
m0=0;
m1=0;
for c=1:N
    A = rgb2gray(imread(['C:\Users\sty\Desktop\ÐÂÎÄ¼þ¼Ð/' num2str(c) '.jpg']));
    [m n]=size(A);
    if c==1
        for i=1:m-1
            if A(i,1)<10 && A(i+1,1)>50 && m0==0
                m0=i+1;
            end
            if A(i,1)>50 && A(i+1,1)<10 && m1==0
                m1=i;
            end
        end
    end
    B=A(m0:m1,:)<120;
    [m n] = size(B);
    r=zeros(1,4);
    n4=int32(n/4);
    for i=1:4
        b = B(:,(i-1)*n4+1:i*n4-4);
        r(i)=find_a_number(b);
    end
    f(c,:) = r;
    
end

ff=1000*f(:,1)+100*f(:,2)+10*f(:,3)+f(:,4);