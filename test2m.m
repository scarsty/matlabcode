%testconv

A = rgb2gray(imread('2m.jpg'));
Ag = gpuArray(A);

tic
BW1 = edge(A,'Canny');
toc
tic
BWg = edge(Ag,'Canny');
toc

