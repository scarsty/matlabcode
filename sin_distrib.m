[n,~]=size(A);
B=A;
for i=1:n
    B(i,:)=128*(1+0.5 * sin(i/10));    
end