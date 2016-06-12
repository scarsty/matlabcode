function E = CalEnergy(L);

Off = [0, 1; 1, 0; -1, 1];

E = 0;
[Rn, Ln] = size(L);

for r = 1:Rn
    for l = 1:Ln
        for i = 1:3

            temp = [r, l] + Off(i, :);
            r1 = temp(1);
            l1 = temp(2);
            if r1 < 1
                r1 = Rn;
            end
            if l1 < 1
                l1 = Ln;
            end
            if r1 > Rn
                r1 = 1;
            end
            if l1 > Ln
                l1 = 1;
            end

            e = CalCoupleEnergy(L(r, l), L(r1, l1));

            E = E + e;

        end
    end
end