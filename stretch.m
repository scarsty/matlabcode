clear;
%t1=double(imread('t1.bmp'))/255;
t0=double(imread('t0.bmp'))/255;%standard image
t1d=double(imread('t1d.bmp'))/255;%deformed image with other info

[m0,n0] = size(t0);
[m1,n1] = size(t1d);

t0d=zeros(m0,n0);

c=1;
s=zeros(m1,1);
% ?于模板上的每一行，?找???上最匹配的行
for i0=1:m0
    i1d_begin=max(1,c-1);
    i1d_end=min(m1,i1d_begin+2);
    p=c;
    if i1d_begin<=i1d_end
        for i1d=i1d_begin:i1d_end
            r=corrcoef(t0(i0,:),t1d(i1d,:));
            s(i1d) = r(1,2);
        end
        [f,p] = max(s(i1d_begin:i1d_end));
        p=p-1+i1d_begin;
        t0d(i0,:)=t1d(p,:);
    end
    c0=c;
    c=p+1;
    if c0>=c
        c=c0+1;
    end
end
%plot(s)
imshow(t0d);

return;
