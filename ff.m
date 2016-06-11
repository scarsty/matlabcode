function out=ff();% ff
% surface energy for FCC
clear
u2=1.04;
u3=1.0;
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



k=0;
for i=1:p-1
    if (out(i,2)==1) %|| (out(i,2)==2 && mod(i,4)==0)
        out(k+1,:)=out(i,:);
        k=k+1;
    end
end
out(:,1)=(1:p-1)';

fid=fopen('ff.lammpstrj','wb');
fprintf(fid,'ITEM:TIMESTEP\n0\nITEM:NUMBER OF ATOMS\n');
fprintf(fid,'%d\n',k);
fprintf(fid,'ITEM:BOX BOUNDS\n-4.0 4.0\n-4.0 4.0\n-4.0 4.0\nITEM:ATOMS id type x y z\n');
for i=1:k
    fprintf(fid,'%d\t%d\t%f\t%f\t%f\n', out(i,1),out(i,2),out(i,3)*5,out(i,4)*5,out(i,5)*5);
end
fclose(fid);
[r l];
U_ff(b2,b3,u2,u3);
out = out(1:k,:);
end

function U=U_ff(b2,b3,u2,u3);
A=[1 0 0; 1 1 0; 1 1 1];
b=zeros(3,1);
b1=1;
% b2最小值是0.5，最大值是1。
%b2=0.5;
% b3取值与另外两个有关，待确定
%b3=1;

b(1)=b1;
b(2)=2*b2;
b(3)=3*b3;

% 所得的解必须全为正，在0到1之间，x2>x3
x=A\b;

if x(2)<0 || x(3)<0 || x(2)>1 || x(3)>1 || x(3)>x(2)
    U=100;
    return
end

%所有的形状均由这一个交点确定
x1=max(x(2:3));
x2=min(x(2:3));
% 八边形面积
%S1=x1^2-0.5*(x1-x2)^2;
%S1=S1*4;
S1=S8(2*x2,(x1-x2)*sqrt(2));
% 矩形面积
S2=(x2*2)*(1-x1)*sqrt(2);
% 六边形面积，六边形的边有两个，一个是(x1-x2)*sqrt(2)，一个是(1-x1)*sqrt(2)
l1=(x1-x2)*sqrt(2);
l2=(1-x1)*sqrt(2);
S3=sqrt(3)/4*(l1+2*l2)^2 - sqrt(3)/4*(l2)^2*3;
% 总面积
S = S1*6 + S2*12 + S3*8;
[S1 S2 S3];
U = S1*6 + S2*12*u2 + S3*8*u3;

% 体积分成3部分
% 求八边形面积公式 S8=l1^2+l2^2+2*sqrt(2)*l1*l2，写成函数S8

l11=2*x1;
l12=(1-x1)*sqrt(2);
l21=2*x2;
l22=(1-x2)*sqrt(2);
l31=2*x2;
l32=(x1-x2)*sqrt(2);
% 棱柱
V1=S8(l11,l12)*x2;
% 拟柱体
V2=V_prismatoid(S8(l11,l12),S8((l11+l21)/2,(l12+l22)/2),S8(l21,l22),x1-x2);
% 拟柱体
V3=V_prismatoid(S8(l21,l22),S8((l21+l31)/2,(l22+l32)/2),S8(l31,l32),1-x1);
% 总体积
V=(V1+V2+V3)*2;
% 体积归一化的面积
if V<0 || S<0 || imag(V)~=0
    U=100;
    return
end

S_norm=(1/V)^(2/3)*S;

U_norm=S_norm/S*U;

U=U_norm;

end

function S = S8(l1,l2)
S=l1^2+l2^2+2*sqrt(2)*l1*l2;
end

function V = V_prismatoid(S1,S2,S3,h)
V=(S1+4*S2+S3)*h/6;
end
