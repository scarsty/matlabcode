% buildM1

M=M2;

for p=3:(NN+2)
    for q=1:2
        if (coord(p,1)-coord(q,1))^2 + (coord(p,2)-coord(q,2))^2 + (coord(p,3)-coord(q,3))^2 == 1
            M(p,q)=1;
            M(q,p)=1;
            M(p,p)=M(p,p)-1;
            M(q,q)=M(q,q)-1;
        end
    end
end