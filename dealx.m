%坐标转换
function y=dealx(x,d,a)
% three crystalline surface
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

if d==1
    x=x+[a a a];
end

if d==1.1
    %x=x+[a a a];
    if a>0
        if x(2)>=x(3)
            x(1)=9999;
        end
    else
        if x(2)<x(3)
            x(1)=9999;
        end
    end
end

if d==1.11
    %x=x+[a a a];
    if a>0
        if x(3)+x(2)+x(1)>2
            x(1)=9999;
        end
    else
        if x(3)+x(2)+x(1)<=2
            x(1)=9999;
        end
    end
end

y=x;
end