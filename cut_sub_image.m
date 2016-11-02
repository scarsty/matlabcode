% °Ñ100µÄÍ¼ÇÐ³É64

n_good=245;


% prepare the file name list
path = 'C:\dat\data\train\sample\corner\';
[names, n] = get_filenames(path);

pathout0 = [path '64/'];
mkdir(pathout0);

for i_image=1:n
    tic
    name =[names{i_image}];
    
    A = imread([path name]);
    i=1;
    while i<=15
        x1=randi([1,123]);
        x2=randi([1,123]);
        B=A(x1:x1+63,x2:x2+63);
        if max(max(B))<100
            continue;
        end
        i=i+1;
        name2 = [pathout0 name '_' num2str(x1) '_' num2str(x2) '_.bmp'];
        imwrite(B,name2);
    end
    fprintf('Sample %d, %s ', i_image, name);
    toc
end
