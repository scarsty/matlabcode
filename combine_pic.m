%conbine images by list file

% prepare the file name list
path = '\dat\data\20160826\highlight/';
fid = fopen([path 'file.txt']);
list=textscan(fid,'%s');
fclose(fid);
names=list{1};

pathout = [path 'sample110/'];
mkdir(pathout);

