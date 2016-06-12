function e = CalCoupleEnergy(a, b)
% 
% e = abs(a-b);
% if e > 20
%     e = 20;
% end

if fix(a) == fix(b)
    e = 0;
else
    e = 1;
end

if mod(a, 1) > 0 
    e = e + 0.5;
end
if mod(b, 1) > 0 
    e = e + 0.5;
end