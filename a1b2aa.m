function A = a1b2mm(str)
A=zeros(1,4);
B=dlmread(str)
k=1;
[N,n]=size(B);
for i1=0:9
    for i2=0:9
        for i3=0:9
            for i4=0:9
                if i1~=i2 && i1~=i3 && i1~=i4 && i2~=i3 && i2~=i4 && i3~=i4                    
                    [m n]=size(B);
                    t=0;                   
                    for j=1:N
                        BB=B(j,1);
                        BBv=[fix(BB/1000),fix(mod(BB,1000)/100),fix(mod(BB,100)/10),mod(BB,10)];
                        [a,b,c]=a1b2([i1,i2,i3,i4],BBv);
                        if a==B(j,2) && b==B(j,3)
                            t=t+1;
                        end
                    end
                    if t==N
                    A(k,:)=[i1,i2,i3,i4];
                    k=k+1;
                    end
                end
            end
        end
    end
end
[m n]=size(A);
m
A(floor(rand()*m)+1,:)
end

function [a,b,c] =  a1b2(R1,R2)
a=0;
b=0;
for i=1:4
    if R1(i)==R2(i);
        a=a+1;
    end
end
for i=1:4
    for j=1:4
        if R1(i)==R2(j);
            b=b+1;
        end
    end
end
b=b-a;
c=a*5+b;
end