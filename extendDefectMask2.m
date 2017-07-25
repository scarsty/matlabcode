defectDir = 'Z:\biel\#3\20170601\defects\'
maskDir = 'Z:\biel\#3\20170601\defects\';
outDir = 'C:\Users\sb\Desktop\2\';
oriDir = 'Z:\biel\#3\20170601\';
txtDir = 'Z:\biel\#3\20170601\';

[defectNames,defectN] = get_filenames(defectDir,'*.png')
minSize = 192
for i = 1:defectN
    defectName = [defectNames{i}];
    k = strfind( defectName,'_mask.png');
    if k>0
        continue;
    end
    oriName = defectName(1:end-10);
    oriNameWithPath = [oriDir oriName];
    defectNameWithPath = [defectDir defectName];
    txtName = [txtDir oriName '_rect.txt'];
    if exist(txtName,'file')==0
        continue;
    end
    COOR=dlmread(txtName,',');
    B = double(rgb2gray(imread(defectNameWithPath)));
    [r,c] = size(B);
    r1=r;
    c1=c;
    %defectName(end-5:end-4)
    line=int32(str2double(defectName(end-4:end-4)))+1;
    [COORr,COORc]=size(COOR);
    if line>COORr
        continue;
    end
    m=COOR(line,2);
    n=COOR(line,1);
    r0=COOR(line,4);
    c0=COOR(line,3);
    if exist(oriNameWithPath,'file')==0
        continue;
    end
    A0=imread(oriNameWithPath);
    fprintf('%d %s\n', i, defectNameWithPath);
    %         A = double(rgb2gray(A0));
    %         B = double(rgb2gray(imread(defectNameWithPath)));
    %         [r,c] = size(B);
    %         r0 = r;
    %         c0=c;
    %         bb=sum(sum(B.*B));
    %         C=1-(filter2(B,A,'valid')/bb-1).^2;
    %         [m, n] = find(C==max(max(C)));
    %         [mr,mc]=size(m);
    %         if mr>1
    %
    %             COOR=dlmread(txtName,',');
    %             [COORr,COORc]=size(COOR);
    %             finded=0;
    %             mm=m;
    %             nn=n;
    %             for rr=1:mr
    %                 for rrc=1:COORr
    %                     if abs(mm(rr)-COOR(rrc,2))<2
    %                         m=mm(rr)
    %                         n=nn(rr);
    %                         finded=1;
    %                         break;
    %                     end
    %                     if finded==1
    %                         break;
    %                     end
    %                 end
    %             end
    %         end
    md=0;
    nd=0;
    md1=0;
    nd1=0;
    %m=m-1;
    %n=n-1;
    if r<minSize
        r=minSize;
        md=floor((minSize-r0)/2);
        md1=floor((minSize-r1)/2);
        m=m-md;
    end
    if c<minSize
        c=minSize;
        nd=floor((minSize-c0)/2);
        nd1=floor((minSize-c1)/2);
        n=n-nd;
    end
    if m<=0 || n<=0
        continue;
    end
    M=zeros(r,c);
    M0=imread([defectNameWithPath(1:end-4) '_mask.png']);
    M(1+md1:md1+r1,1+nd1:nd1+c1)=M0;
    %AA=A(m:m+r-1,n:n+c-1);
    imwrite(A0(m:m+r-1,n:n+c-1,:), [outDir oriName '_' num2str(m) '_' num2str(n) '_.png']);
    imwrite(M, [outDir oriName '_' num2str(m) '_' num2str(n) '_.png_mask.png']);
end