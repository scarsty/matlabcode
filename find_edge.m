%寻找边界
I = imread('1.tif');

se = strel('disk',2);
BW1 = edge(I,'log',0);
%BW1 = edge(BW1,'log',0);
%BW1 = imopen(BW1,se);
figure, imshow(BW1)
BW3=imfill(BW1,'holes');
figure, imshow(BW3)
stop
[w,h]=size(I);

result=zeros(w,h);

bound=zeros(w*h,2);
k=1;
for ix1=1:w
    for iy1=1:h
        if BW1(ix1,iy1)==1
            bound(k,:)=[ix1,iy1];
            k=k+1;
        end
    end
    %fprintf('%d\n',ix1);
end
k=k-1;
for k1=1:k
    for ix2=1:w
        for iy2=1:h
            ix1=bound(k1,1);
            iy1=bound(k1,2);
            for r=15
            f=(ix1-ix2)^2 + (iy1-iy2)^2-r^2;
            if abs(f)<2
                result(ix2,iy2)=1+result(ix2,iy2);
            end
            end
        end
    end
end
%result=fft2(BW1);
imagesc(result)
axis equal