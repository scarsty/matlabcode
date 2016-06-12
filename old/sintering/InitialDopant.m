% InitialDopant.

for i = 1:fix(D * D * 0.05)
    x = 1 + fix(rand*D);
    y = 1 + fix(rand*D);
    
    L(x, y) = L(x, y) + 0.5;
    
end