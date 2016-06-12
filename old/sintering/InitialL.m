% InitialL


L = zeros(D, D);

x1 = [1, 0];
x2 = [1/2, sqrt(3)/2];

for i = 1:500
    x = 1 + fix(rand*D);
    y = 1 + fix(rand*D);
    L(x, y) = fix(rand*Q);
    for i1 = (x-5):(x+5)
        for i2 = (y-5):(y+5)
            if i1 > 0 & i2 > 0 & i1 <= D & i2 <= D & rand < (7-norm((i1 - x) * x1 + (i2 - y) * x2)) / 5 & L(i1, i2) == 0
                L(i1, i2) = L(x, y);
            end
        end
    end
end

for i1 = 2:D-1
    for i2 = 2:D-1
        if L(i1-1, i2)==L(i1+1, i2)
            L(i1, i2) = L(i1-1, i2);
        end
        if L(i1, i2-1)==L(i1, i2+1)
            L(i1, i2) = L(i1, i2-1);
        end
        if L(i1-1, i2+1)==L(i1+1, i2-1)
            L(i1, i2) = L(i1-1, i2+1);
        end
    end
end

for i1 = 2:D-1
    for i2 = 2:D-1
        if L(i1-1, i2)==L(i1+1, i2)
            L(i1, i2) = L(i1-1, i2);
        end
        if L(i1, i2-1)==L(i1, i2+1)
            L(i1, i2) = L(i1, i2-1);
        end
        if L(i1-1, i2+1)==L(i1+1, i2-1)
            L(i1, i2) = L(i1-1, i2+1);
        end
    end
end

L0 = L;

ip = 1;