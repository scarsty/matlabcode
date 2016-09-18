%conbine images by list file
function combine_images(path, w, h, c)
% prepare the file name list
[names, n] = get_filenames(path);

%w = 64;
%h = 64;
%c=1;
% easy to combine  
fid2 = fopen([path 'file.bin'], 'wb');


fwrite(fid2,w,'int');
fwrite(fid2,h,'int');
fwrite(fid2,c,'int');
fwrite(fid2,n,'int');
fprintf('total %d images\n', n);
tic
for i_image=1:n
    name =[path names{i_image}];
    A = transpose(imread(name));
    fwrite(fid2,A,'uint8');
    if mod(i_image, 1000)==0
        fprintf('%d images\n', i_image);
    end
end
toc
fclose(fid2);

end