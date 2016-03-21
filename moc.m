n=1;
fid=fopen('moc.txt','wb');
str='%s\t%f\t%f\t%f\n';
d=100;
a=0;

coordif1=[0 0 0; 1 1 0; 1 0 1; 0 1 1]/2;
coordif2=[1 0 0; 0 1 0; 0 0 1; 1 1 1]/2;
for k=0:n%[0 1]
    for j=0:n
        for i=0:n
            for c=1:4
                x=[i,j,k]+coordif1(c,:);
                x=dealx(x,d,a);
                fprintf(fid,str,'Mo',x(1),x(2),x(3));
                x=[i,j,k]+coordif2(c,:);
                x=dealx(x,d,a);
                fprintf(fid,str,'C',x(1),x(2),x(3));
            end
        end
    end
end
fclose(fid);
