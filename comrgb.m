
for i=[40,25,39]
img1 = imread(['Z:\biel\#1\20170607\170607105929_',num2str(i),'.png']);
img2 = imread(['Z:\biel\#2\20170607\170607105929_',num2str(i),'.png']);
img3 = imread(['Z:\biel\#3\20170607\170607105929_',num2str(i),'.png']);

[m,n]=size(img1);

A=cat(3,img1,img2,img3);
imwrite(A, [num2str(i) '.png'])
end
