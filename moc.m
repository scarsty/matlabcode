n=3;
fid=fopen('moc.txt','wb');
for i=0:n
    for j=0:n
        for k=0:n
            fprintf(fid,'%s\t%f\t%f\t%f\n','Mo',0.0+i,0.0+j,0.0+k);
            fprintf(fid,'%s\t%f\t%f\t%f\n','Mo',0.5+i,0.5+j,0.0+k);
            fprintf(fid,'%s\t%f\t%f\t%f\n','Mo',0.5+i,0.0+j,0.5+k);
            fprintf(fid,'%s\t%f\t%f\t%f\n','Mo',0.0+i,0.5+j,0.5+k);
            
            fprintf(fid,'%s\t%f\t%f\t%f\n','C',0.5+i,0.0+j,0.0+k);
            fprintf(fid,'%s\t%f\t%f\t%f\n','C',0.0+i,0.5+j,0.0+k);
            fprintf(fid,'%s\t%f\t%f\t%f\n','C',0.0+i,0.0+j,0.5+k);
            fprintf(fid,'%s\t%f\t%f\t%f\n','C',0.5+i,0.5+j,0.5+k);
        end
    end
end
fclose(fid);