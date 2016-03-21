function y=dealx(x,d,a)
if d==100
    if x(3)>=1
        x(3)=x(3)+a;
    end
end

if d==110
    if x(2)>x(3)
        x(3)=x(3)+2;
    end
    if x(3)-x(2)>=1
        x(3)=x(3)+a;
    end
end

if d==111
    if x(1)+x(2)>x(3)
        x(3)=x(3)+2;
    end
    if x(1)+x(2)>x(3)
        x(3)=x(3)+2;
    end
    if x(3)-x(2)-x(1)>=1
        x(3)=x(3)+a;
    end
end
y=x;
end