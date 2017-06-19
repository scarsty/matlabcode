function r=find_a_number(b)
d=zeros(10,7);
d(1,:)=[0 0 1 0 0 1 0];
d(2,:)=[1 0 1 1 1 0 1];
d(3,:)=[1 0 1 1 0 1 1];
d(4,:)=[0 1 1 1 0 1 0];
d(5,:)=[1 1 0 1 0 1 1];
d(6,:)=[1 1 0 1 1 1 1];
d(7,:)=[1 0 1 0 0 1 0];
d(8,:)=[1 1 1 1 1 1 1];
d(9,:)=[1 1 1 1 0 1 1];
d(10,:)=[1 1 1 0 1 1 1];

[m, n] = size(b);
k=zeros(1,7);

k(1)=sum(b(int32(1:m/3),int32(n/2)));
k(4)=sum(b(int32(m/3:m*2/3),int32(n/2)));
k(7)=sum(b(int32(m*2/3:m),int32(n/2)));

k(2)=sum(b(int32(m*1/3), int32(1:n/2)));
k(3)=sum(b(int32(m*1/3), int32(n/2:n)));

k(5)=sum(b(int32(m*2/3), int32(1:n/2)));
k(6)=sum(b(int32(m*2/3), int32(n/2:n)));
%k
kk=int32(k>15);


r=0;
for i=1:9
    if sum(kk==d(i,:))==7
        r=i;
    end
end

end