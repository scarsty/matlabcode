s=0;
for i=1:100
    r=1+fix(20*rand(1));
    l=1+fix(20*rand(1));
    if mod(r,2)==1
        s=s+1;
    end
end
s