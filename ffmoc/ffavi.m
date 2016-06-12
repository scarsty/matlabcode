%伪造一个结晶过程
out=dlmread('ff.txt');
rate=0.001;
[n,l]=size(out);

coord=out(:,3:5);
v=(rand(n,3)-0.5)*rate;
nv=norm(v);
f=zeros(n,3);
%这里模拟一个简单的动力学过程
 
fid=fopen('ff1.lammpstrj','wb');
for step=0:500
    tic
    f(:,:)=0;
    if step>0
       for i=1:n
            for j=1:n
                p1 = coord(i,:)-coord(j,:);
                np1=norm(p1);
                if np1<0.14
                    f(i,:)=f(i,:)+p1*rate*(0.14-np1)^3/0.14^3;
                end
            end
            if norm(coord(i,:))> 1.08
                f(i,:)=f(i,:)-coord(i,:)*rate;
            end
        end
        v=v+f;
        v=v+(rand(n,3)-0.5)*rate/3;
        v=v/norm(v)*nv;
        coord=coord+v;
        out(:,3:5)=coord;
    end
    fprintf(fid,'ITEM:TIMESTEP\n%d\nITEM:NUMBER OF ATOMS\n',step);
    fprintf(fid,'%d\n',n);
    fprintf(fid,'ITEM:BOX BOUNDS\n-4.0 4.0\n-4.0 4.0\n-4.0 4.0\nITEM:ATOMS id type x y z\n');
    for i=1:n
        fprintf(fid,'%d\t%d\t%f\t%f\t%f\n', out(i,1),out(i,2),out(i,3)*5,out(i,4)*5,out(i,5)*5);
    end
    fprintf('step=%d  ', step)
    toc
end

fclose(fid);
