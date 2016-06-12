d=9;

for d=[2 3 4 5 6 7 8 9]
    a=imread([num2str(d) '.tif']);
    a=255-a;
    a1=255.0*double(a)/double(max(max(a)));
    s=a1(1,:);
    for i=2:28
        s=[s a1(i,:)];
    end
    max(s)
    r=zeros(1,10);
    s=s/255;
    
    r(1+d)=1;
    s=[s r];
    if d==2
        ss=s;
    else
        ss=[ss;s];
    end
end
dlmwrite('a.txt',ss);