% 把一张大图拆成小图

path = 'C:\dat\data\test\';
% prepare the file name list
[names, n] = get_filenames(path);

pathout0 = [path 'sample/0/'];
mkdir(pathout0);

% size of the small image
l=128;

% region
x_r0 = l;
y_r0 = l;
x_r1 = 16384-l;
y_r1 = 24576-l;

name =[names{1}];
%name='A_160826111948_10.bmp';
A = imread([path name]);
A2 = imread([path name '_c2.png']);
k=0;
for x0=x_r0:l:x_r1
    for y0=y_r0:l:y_r1
        x1=x0+l-1;
        y1=y0+l-1;
        B=A(y0:y1,x0:x1);
        B2=A2(y0:y1,x0:x1);
        if (max(max(B))>40)
            name2 = [pathout0 name '_' num2str(k) '_' num2str(x0) '_' num2str(y0) '.bmp'];
            name22 = [pathout0 name '_' num2str(k) '_' num2str(x0) '_' num2str(y0) '.bmp_c2.png'];
            imwrite(B,name2);
            imwrite(B2,name22);
            k=k+1;
        end
    end
end
k