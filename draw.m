xs=1;
% 1 - chi_s, 0 - gap function
if xs==0
    a=s(:,7:9);
else
a=s(:,2:4);
end


b=zeros(9,9);
b1=b;
k=1;
for i=1:64
    b(5+a(i,1)*8,5+a(i,2)*8)=a(i,3);
end

for i=1:9
    b(1,i)=b(9,i);
    b(i,1)=b(i,9);
end

b(1,1)=b(9,9);

if xs==0
    for i=1:9
        b1(i,:)=b(10-i,:);
    end
else
    b1=b';
end

b=(b+b1)/2;

c=imresize(b,20,'bicubic');

%contour(c)
fig = figure;
imagesc(c);
%colormap(fig,'jet')
l=size(c);
axis equal
xlim([1 l(1)]);
ylim([1 l(1)]);
axis off
if xs==1
    colorbar('fontsize',20)
end
print(fig,'-r300','-dpng','t.png');

RGB=imread('t.png');

[l,m,n]=size(RGB);
x0=-1;
y0=-1;
x1=-1;
y1=-1;
find0=0;
for i=1:l;
    for j=1:m;
        %sum(RGB(i,j,:))
        if sum(RGB(i,j,:))~=255*3
            x1=max(i,x1);
            y1=max(j,y1);
            if find0==0
                x0=x1;
                y0=y1;
            end
            find0=1;
        end
    end
end
RGB2=imcrop(RGB,[y0,x0,y1-y0+1,x1-x0+1]);
imwrite(RGB2,'t1.png');