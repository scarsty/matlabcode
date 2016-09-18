function [names,n] = get_filenames(path)
list = dir([path '*.bmp']);
n = length(list);
names=cell(n,1);
for i=1:n
    names{i}=list(i).name;
end
end