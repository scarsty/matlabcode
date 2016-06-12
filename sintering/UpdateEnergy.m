function E_new = UpdateEnergy(L, x, y, new, old, E_old);

% E_ref = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, ...
%     19, 20, 20, 20, 20];

E = E_old;

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

    e = CalCoupleEnergy(old, L(x1, y1));
    E = E - e;

    e = CalCoupleEnergy(new, L(x1, y1));
    E = E + e;

end

E_new = E;
