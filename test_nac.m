A=zeros(100,100);
for i=1:100
    for j=1:100
        A(i,j)=tanh(i/10-5)*sigmoid(j/10-5);        
    end
end