% 从大图上随机取小图

% prepare the file name list
path = 'C:\dat\data\Bad\';
fid = fopen([path '\file.txt']);
list=textscan(fid,'%s');
fclose(fid);
names=list{1};

pathout0 = [path 'sample/0/'];
mkdir(pathout0);
pathout1 = [path 'sample/1/'];
mkdir(pathout1);

% region
x_r0=2000;
x_r1=13000;
y_r0=3000;
y_r1=20000;

% size of the small image
l=100;

[n, temp] = size(names);

%
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
    for j=1:n_defect
        x0_d=defect_pos(j,1);
        y0_d=defect_pos(j,2);
        x1_d=x0_d+defect_pos(j,3);
        y1_d=y0_d+defect_pos(j,4);
        
        x0_2=floor((200-(x1_d-x0_d))/2);
        y0_2=floor((200-(y1_d-y0_d))/2);
        
        x1_2=x0_2+200-1;
        y1_2=y0_2+200-1;
        
        %B=A(y0_2:y1_2,x0_2:x1_2);
        B=A(y0_d:y1_d,x0_d:x1_d);
        name2 = [pathout1 name '_' num2str(j) '_' num2str(x0_d) '_' num2str(y0_d) '.bmp'];
        imwrite(B,name2);
    end
    
    
    % cut some good regions
    i=1;
    while i<=500
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
