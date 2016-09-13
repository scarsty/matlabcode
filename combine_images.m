%conbine images by list file

% prepare the file name list
path = 'C:\dat\data\20160907\HL\20160907-bad\sample\';
fid = fopen([path 'file.txt']);
list=textscan(fid,'%s %d');
fclose(fid);
names=list{1};

pathout = [path 'sample110/'];
mkdir(pathout);

[n, temp] = size(names);

w = 100;
h = 100;
c=1;
% easy to combine  
fid2 = fopen([path 'file.bin'], 'wb');


fwrite(fid2,w,'int');
fwrite(fid2,h,'int');
fwrite(fid2,c,'int');
fwrite(fid2,n,'int');

for i_image=1:n
    name =[path names{i_image}];
    A = transpose(imread(name));
    fwrite(fid2,A,'uint8');
end
fclose(fid2);

