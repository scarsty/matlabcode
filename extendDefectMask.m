
close all; clear all; clc;
% 1. extend mask
txtDir = 'C:\Users\sb\Desktop\labeltxt\'
maskDir = 'C:\dat\abs\1\';
outDir = 'C:\Users\sb\Desktop\labeltxt\11\'

[txtNames,txtN] = get_filenames(txtDir,'*.txt');
minSize = 192
for i = 1:txtN
     txtName = [txtNames{i}];
     rect = load([txtDir txtName]);
     [rows,cols] = size(rect);
     for j = 1:rows
         x = ceil(rect(j,1));
         y = ceil(rect(j,2));
         nWidth = ceil(rect(j,3));
         nHeight = ceil(rect(j,4));  
         r1 = [rect(j,1),rect(j,2),rect(j,3),rect(j,4)];
                           
         [lStart,lEnd] = size(txtName);
         lEnd = lEnd - 9;      
         maskName = [txtName(:,1:lEnd) '_rect' num2str(j-1) '_mask.png'];
         if ~exist([maskDir maskName])
             continue;
         end
         mask = imread([maskDir maskName]);
         [mRows,mCols] = size(mask);
         
         if((mRows >= minSize) && (mCols >= minSize))
             maskName = [txtName(:,1:lEnd) '_rect' num2str(j-1) '_mask.png'];
             copyfile([maskDir maskName],outDir,'f'); 
             continue;
         end

         eX = 1;
         if( mRows < minSize)
             x = r1(:,1) - (minSize - r1(:,4))/2; 
             nHeight = minSize;
             eX = int32(nHeight/2 - mRows/2);
             if(x < 0)
                 x = 1;
                 eX = 1;
             end
         end
         
          eY = 1;
         if(mCols < minSize)
             y = r1(:,2) - (minSize - r1(:,3))/2;
             nWidth = minSize;
             eY = int32(nWidth/2 - mCols/2);
             if(y < 0)
                 y = 1;
                 eY = 1;
             end
         end
                                                  
         exMask = uint8(zeros(nHeight,nWidth));
         if(eX == 1)
             exRowE = mRows;
         else
             exRowE = mRows+eX-1;
         end
         
         if(eY == 1)
             exColE = mCols;
         else
             exColE = mCols+eY-1;
         end
         exMask(eX:exRowE,eY:exColE) = mask(1:mRows,1:mCols);

         imwrite(exMask,[outDir maskName]);
    end
end


% % 2.extend defect
% txtDir = 'C:\Users\sb\Desktop\labeltxt\';
% %oriDir = 'U:\biel\20170601\#3\';
% oriDir = 'V:\data\slider ABS 5 projects + HGA 1 project\GIJ770-NG-1000\';
% outDir = 'C:\Users\sb\Desktop\labeltxt\11\';
% 
% [txtNames,txtN] = get_filenames(txtDir,'*.txt');
% minSize = 192
% 
% for i = 1:txtN
%     txtName = [txtNames{i}];
%     rect = load([txtDir txtName]);
%     [rows,cols] = size(rect);
%     for j = 1:rows
%          x = ceil(rect(j,1));
%          y = ceil(rect(j,2));
%          nWidth = ceil(rect(j,3));
%          nHeight = ceil(rect(j,4));  
%          r1 = [rect(j,1),rect(j,2),rect(j,3),rect(j,4)];
%          [lStart,lEnd] = size(txtName);
%          lEnd = lEnd - 9;   
%          dfOnImgName = txtName(:,1:lEnd);
%         
%          if( nHeight < minSize)
%              tmpH = mod(r1(:,4),2);
%              if(tmpH == 0)
%                 x = r1(:,1) - (minSize - r1(:,4))/2;
%              else
%                  x = r1(:,1) - (minSize - r1(:,4) - 1)/2;
%              end
%              if(x < 0)
%                  x = 0;
%              end
%              nHeight = minSize;
%          end
%          
%          if(nWidth < minSize)
%              tmpW = mod(r1(:,3),2);
%              if(tmpW == 0)
%                  y = r1(:,2) - (minSize - r1(:,3))/2;
%              else
%                  y = r1(:,2) - (minSize - r1(:,3) - 1)/2;
%              end
%              
%              if(y < 0)
%                  y = 0;
%              end
%              nWidth = minSize;
%          end
%                   
%             if exist([oriDir dfOnImgName],'file')      >0                      
%          img = imread([oriDir dfOnImgName]);
%          rects = [x,y,nWidth-1,nHeight-1];
%          imgI2 = imcrop(img,rects);
%          imwrite(imgI2,[outDir dfOnImgName '_rect' num2str(j-1) '.png']);
%             end
%     end
% end

