path = 'C:\dat\caffe\Build\x64\Release\try2\test/';
fid = fopen([path 'list.txt']);
list=textscan(fid,'%s %d');
fclose(fid);

[N l]=size(list{1});
names=list{1};

for i=1:38
name=names{A(i)+1}
copyfile([path name], [path 'error-conv/' name(1:2) num2str(A(i)+1) name(3:end)]);
end

for i=1:0
    name=names{i};
    for a=[90,180,270,45,135,225, 315]
        img = imread([path name]);
        img1 = imrotate(img, a);
        newname=[path 'tran/' name num2str(a) '.bmp'];
        imwrite(img1,newname);
    end
end

for i=1:0
    name=names{i};
    s=[path '/' name];
    mat0=imread(s);
    mat=zeros(100,100, 'uint8');
    [r0, l0] = size(mat0);
    r=max(1,round((100-r0)/2));
    l=max(1,round((100-l0)/2));
    w=min(100,r0);
    h=min(100,l0);
    mat(r:r+w-1,l:l+h-1)=mat0(1:w,1:h);
    imwrite(mat,[path '/sp/',name]);
end

p = randperm(N);
for i=1:0
    name=names{p(i)};
    movefile([path name],[path 'train/' name]);
end
for i=2201:0
    name=names{p(i)};
    movefile([path name],[path 'test/' name]);
end