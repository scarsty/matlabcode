%conv2;
%训练卷积核测试

a=[1 2 3 5; 2 5 4 6; 0 9 8 7; 1 4 6 4]/10;
b=[0.4,0.3;0,0.1];
e=[2 3 3; 4 5 0; 7 9 0]/10; %expect

r=myconv2(a,b)
c=r-e;
error = sum(sum(c.*c));
for i=2:100
    c=r-e; %error
    db=myconv2(a,c);
    b=b-0.5/4*db;
    r=myconv2(a,b); %result
    c=r-e;
    error(i) = sum(sum(c.*c));
end
plot(error);