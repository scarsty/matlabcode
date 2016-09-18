% °Ñ100µÄÍ¼ÇÐ³É64

n_good=500;


% prepare the file name list
path = 'C:\dat\data\20160907-bad\sample\1_100\';
[names, n] = get_filenames(path);

pathout0 = [path '64/'];
mkdir(pathout0);

for i_image=1:n
    tic
    name =[names{i_image}];
    
    A = imread([path name]);    

        B=A(19:82,19:82);
        name2 = [pathout0 name];
        imwrite(B,name2);

    fprintf('Sample %d, %s ', i_image, name);
    toc
end
