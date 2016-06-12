% buildM2

M2=zeros(NN+2, NN+2);

for p=3:(NN+1)
    for q=(p+1):(NN+2)
        if (coord(p,1)-coord(q,1))^2+(coord(p,2)-coord(q,2))^2+(coord(p,3)-coord(q,3))^2==1
            M2(p,q)=1;
            M2(q,p)=1;
            M2(p,p)=M2(p,p)-1;
            M2(q,q)=M2(q,q)-1;
        end
    end
end