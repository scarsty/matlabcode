a1=single(imread('1.png'));
a2=single(imread('2.png'));

c1=single(imread('c1.png'));
c2=single(imread('c2.png'));
c3=single(imread('c3.png'));
c4=single(imread('c4.png'));

x1=conv2(a2,c1,'valid');
x2=conv2(a2,c2,'valid');
x3=conv2(a2,c3,'valid');
x4=conv2(a2,c4,'valid');

[m,n]=find(x1==max(max(x1)))