function C=myconv2(A,B)
    [ma na]=size(A);
    [mb nb]=size(B);
    mc=ma-mb+1;
    nc=na-nb+1;
    C=zeros(mc, nc);
    for i=1:mc
        for j=1:nc
            C(i,j)=sum(sum(B.*A(i:i+mb-1,j:j+nb-1)));
        end
    end
end