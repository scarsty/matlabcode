% 从大图上随机取小图

% prepare the file name list
path = '\dat\data\20160826\highlight/';
fid = fopen([path 'file.txt']);
list=textscan(fid,'%s');
fclose(fid);
names=list{1};

pathout = [path 'sample110/'];
mkdir(pathout);

% region
x0=1600;
x1=14000;
y0=1200;
y1=19300;

% size of the small image
l=100;

%
for t=1:1
    tic
    %name = ['T_' num2str(t) '.bmp'];
    name =[names{t}];
    name_full = [path name];
    A = imread(name_full); 
    for i=1:500        
        x=unidrnd(x1-x0)+x0;
        y=unidrnd(y1-y0)+y0;
        xx=x+l-1;
        yy=y+l-1;
        B=A(y:yy,x:xx);
        name2 = [pathout name '_' num2str(i) '_' num2str(x) '_' num2str(y) '.bmp'];
        imwrite(B,name2);
    end
    fprintf('Sample%d, ', t);
    toc
end