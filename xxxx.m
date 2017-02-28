path='X:\\data\\GMA\\workspace\\@0trainData\\OK\\croped\\';
list = dir([path '*.bmp']);

n = length(list);
names=cell(n,1);
for i=1:n
    names{i}=list(i).name;
end

for i=1:2
    region = zeros(1,4);
    k=1;
    name=names{i};
    %'crop_6A0AU_A3643XXXXXXXXXX.jpg.bmp'
    if name(12)=='X'
        region(k,:)=[1 2 3 4];
        k=k+1;
    end
    if name(17)=='X'
        region(k,:)=[1 2 3 4];
        k=k+1;
    end
    if name(22)=='X'
        region(k,:)=[1 2 3 4];
        k=k+1;
    end
    if regions(1,1)~=0
        imwrite([name{i} '_defect.txt'], regions);
    end
end