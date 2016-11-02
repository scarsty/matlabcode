function C=corr3(A,B)
 [mA,nA]=size(A);
 [mB,nB]=size(B);

 mC=mA+1-mB;
 nC=nA+1-nB;
 
 C=zeros(mC,nC);
 b=sqrt(sum(sum(B.*B)));
 for m=1:mC
     for n=1:nC
         A1=A(m:m+mB-1,n:n+nB-1);
         v=sum(sum(A1.*B));
         a=sqrt(sum(sum(A1.*A1)));
         C(m,n)=v/a/b;
     end
 end
 
end