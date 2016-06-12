function E = CalNeighborEnergy(L, x, y)

E = 0;
Off = [0, 1; 1, 0; 0, -1; -1, 0; -1, 1; 1, -1];
[Rn, Ln] = size(L);

for i = 1:6

    temp = [x, y] + Off(i, :);
    x1 = temp(1);
    y1 = temp(2);
    if x1 < 1
        x1 = Rn;
    end
    if y1 < 1
        y1 = Ln;
    end
    if x1 > Rn
        x1 = 1;
    end
    if y1 > Ln
        y1 = 1;
    end

    e = CalCoupleEnergy(L(x, y), L(x1, y1));
    E = E + e;

end