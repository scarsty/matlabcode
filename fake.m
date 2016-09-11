path = '\dat\data\20160617All_fake/';
fid = fopen([path 'train0.txt']);
list=textscan(fid,'%s %d');
fclose(fid);
names=list{1};
[N l]=size(list{1});
names=list{1};
labels=list{2};
k=1;
p=cell(8000,1);
for i=1:N
    for c=1:30
    if labels(i)==1
        old=[path names{i}];
        new=[old num2str(c) '.bmp'];
        p{k}=[names{i} num2str(c) '.bmp    1'];
        k=k+1;
        %copyfile(old, new);
        delete(new);
    end
    end
end

return

% ¿©≥‰Õº∆¨µΩ100*100
for i=1:N
    ss=list(i);
    s=[path '/' ss{1}];
    mat0=imread(s);
    mat=zeros(100,100, 'uint8');
    [r0, l0] = size(mat0);
    r=max(1,round((100-r0)/2));
    l=max(1,round((100-l0)/2));
    w=min(100,r0);
    h=min(100,l0);
    mat(r:r+w-1,l:l+h-1)=mat0(1:w,1:h);
    imwrite(mat,[path '/sp/',ss{1}]);
end