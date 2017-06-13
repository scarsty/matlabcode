path  ='C:\dat\data\sae\JL@astri1000\';

names = get_filenames(path);

x0=85;
x1=x0+700;
y0=1030;
y1=y0+270;

for i=1:1000
    name=char(names(i));
    A=imread([path name]);
    B=A(y0:y1,x0:x1,:);
    imwrite(B,['C:\dat\data\sae\crop\' name '_crop.png']);
end