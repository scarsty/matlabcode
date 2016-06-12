% The MC process.

Step = 10000 * MCS;

E = CalTotalEnergy(L);

A = 1 / 2;
T = 1273;
E_surface = 1e-19;

tic
k = 1;
for i = i_start:Step
    
    x = 1 + fix(rand*D);
    y = 1 + fix(rand*D);    
    
    if rand < exp((CalNeighborEnergy(L, x, y) - 6) * E_surface / (k_B * TemperatureCurve(i)))
        p = L(x, y);
        n = fix(rand*Q);
        E_new = UpdateEnergy(L, x, y, n, p, E);
        if rand < 1 / (1 + exp((E_new - E) * E_surface / (k_B * TemperatureCurve(i))))
            L(x, y) = n;
            E = E_new;
        else
            L(x, y) = p;
        end
    end
    
    if mod(i, 100 * MCS) == 0
        i
        E
        toc
        E_step(k) = E;
        T_step(k) = TemperatureCurve(i);
        k = k + 1;
        %dlmwrite(['L' int2str(i / MCS) 'MCS.txt'], L);
        %OutputImage(L, ['L' int2str(i / MCS) 'MCS.png']);
    end
    
end

dlmwrite('E.csv', E_step);
dlmwrite('T.csv', T_step);