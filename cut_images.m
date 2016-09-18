% 从大图上随机取小图

n_good=1000;

path = 'C:\dat\data\20160907-bad\';
% prepare the file name list
[names, n] = get_filenames(path);

pathout0 = [path 'sample/0-t/'];
mkdir(pathout0);
pathout1 = [path 'sample/1/'];
pathout2 = [path 'sample/1-1/'];
mkdir(pathout1);

% region
x_r0=2000;
x_r1=13000;
y_r0=3000;
y_r1=20000;

% size of the small image
l=64;

for i_image=1:n
    tic
    name =[names{i_image}];
    defect_name = [path 'QCdefect\' name '_defect.txt'];
    n_defect=0;
    if exist(defect_name, 'file')
        defect_pos = dlmread(defect_name);
        [n_defect, temp] = size(defect_pos);
    end
    
    A = imread([path name]);
    
    % cut the bad regions
    for j=1:0
        % origin values
        x0_d=defect_pos(j,1);
        y0_d=defect_pos(j,2);
        w_d=defect_pos(j,3);
        h_d=defect_pos(j,4);
        x1_d=x0_d+w_d;
        y1_d=y0_d+h_d;
        
        % here cut the origin defect region
        B=A(y0_d:y1_d,x0_d:x1_d);
        name2 = [pathout2 name '_' num2str(j) '_' num2str(x0_d) '_' num2str(y0_d) '.bmp'];
        %imwrite(B,name2);
        
        % here cut some defect region, the step is 50
        w_dm=floor((w_d+l-1)/l)*l;
        h_dm=floor((h_d+l-1)/l)*l;
        x0_dm=floor(x0_d-(w_dm-w_d)/2);
        y0_dm=floor(y0_d-(h_dm-h_d)/2);
        x1_dm=x0_dm+w_dm-1;
        y1_dm=y0_dm+h_dm-1;
        k=1;
        for x=(x0_dm):50:(x1_dm+1-l)
            for y=(y0_dm):50:(y1_dm+1-l)
                B=A(y:(y+l-1),x:(x+l-1));
                name2 = [pathout1 name '_' num2str(j) '_' num2str(x) '_' num2str(y) '.bmp'];
                imwrite(B,name2);
                k=k+1;
            end
        end
    end
    
    
    % cut some good regions
    i=1;
    while i<=n_good
        x0=unidrnd(x_r1-x_r0)+x_r0;
        y0=unidrnd(y_r1-y_r0)+y_r0;
        x1=x0+l-1;
        y1=y0+l-1;
        in = 0;
        for j=1:n_defect
            x0_d=defect_pos(j,1);
            y0_d=defect_pos(j,2);
            x1_d=x0_d+defect_pos(j,3);
            y1_d=y0_d+defect_pos(j,4);
            % test the region in the defect
            if (y1<y0_d || y0 > y1_d) && (x1<x0_d || x0 > x1_d)
                in = 0;
            else
                in = 1;
            end
        end
        if in==1
            continue
        end
        B=A(y0:y1,x0:x1);
        name2 = [pathout0 name '_' num2str(i) '_' num2str(x0) '_' num2str(y0) '.bmp'];
        imwrite(B,name2);
        i=i+1;
    end
    fprintf('Sample %d, %s ', i_image, name);
    toc
end
