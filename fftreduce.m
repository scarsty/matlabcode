img =rgb2gray( imread('C:\Users\sb\Desktop\test_edge\1.png'));

c=zeros(1,32);

for i=1:64
    for j=1:64
        k=floor(img(i,j)/8);
        c(k)=c(k)+1;
    end
end
s=0;
for i=1:32
    if c(i)>0
    s=s-c(i)/4096*log2(c(i)/4096);
    end
end
s


