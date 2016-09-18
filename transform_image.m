%transform images

% prepare the file name list
path = 'C:\dat\data\Train\sample\1\';
[names, n] = get_filenames(path);

rotate=0;

for i_image=1:n*rotate
    tic
    name =[names{i_image}];
    A = imread([path name]);
    B = rot90(A,2);
    imwrite(B,[path name '_180.bmp']);
    B = rot90(A,1);
    imwrite(B,[path name '_90.bmp']);
    B = rot90(A,3);
    imwrite(B,[path name '_270.bmp']);
    AA = fliplr(A);
    imwrite(AA,[path name '_flip.bmp']);
    B = rot90(AA,2);
    imwrite(B,[path name '_flip_180.bmp']);
    B = rot90(AA,1);
    imwrite(B,[path name '_flip_90.bmp']);
    B = rot90(AA,3);
    imwrite(B,[path name '_flip_270.bmp']);
end



