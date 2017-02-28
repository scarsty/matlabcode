A=zeros(128,128);
for i=54:74
    for j=54:74
    A(i,j)=min(1,max(0,0.6*(1-((i-64)^2+(j-64)^2)/100)+rand()*0.05-0.025));
    end
end
imshow(A);