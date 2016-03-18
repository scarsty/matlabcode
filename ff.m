% ff
% surface energy for FCC
clear
u2=1.1;
u3=1;
%u2=3*sqrt(2)/4;
%u3=2*sqrt(3)/4;
% ----------------------
for i=1:101
    for j=1:101
        b2=(i-1)/100;
        b3=(j-1)/100;
        U(i,j)=U_ff(b2,b3,u2,u3);
    end
end
[r,l]=find(U==min(min(U)));
%U(r,l)

b2=(r-1)/100;
b3=(l-1)/100;
p=1;
c=zeros(1,3);
out=zeros(1,5);
for i=-10:10
    for j=-10:10
        for k=-10:10
            x=abs([i j k]/10);
            xx=[i j k]/10;
            if x(2)+x(1)<b2*2 && x(2)+x(3)<b2*2 && x(3)+x(1)<b2*2 && sum(x)<b3*3 
                c(p,:)=xx;
                out(p,2)=1;
                if mod(i+j+k,2)==1
                    out(p,2)=2;
                end
                out(p,3:5)=xx;
                p=p+1;
            end
        end
    end
end
[r l]
U_ff(b2,b3,u2,u3)
out(:,1)=(1:p-1)';

fid=fopen('ff.lammpstrj','wb');
fprintf(fid,'ITEM:TIMESTEP\n0\nITEM:NUMBER OF ATOMS\n');
fprintf(fid,'%d\n',p-1);
fprintf(fid,'ITEM:BOX BOUNDS\n-4.0 4.0\n-4.0 4.0\n-4.0 4.0\nITEM:ATOMS id type x y z\n');
for i=1:p-1
    fprintf(fid,'%d\t%d\t%f\t%f\t%f\n', out(i,1),out(i,2),out(i,3)*2,out(i,4)*2,out(i,5)*2);
end
fclose(fid);

