clear;
N=900;
f=zeros(2,4);
m0=1;
m1=0;
for c=1:N
    name=['C:\Users\sb\Desktop\dabian\PDMS-6000-step\' num2str(c) '.jpg'];
    if exist(name,'file')==0
        break;
    end
    A = rgb2gray(imread(name));
    %A=imrotate(A,90);
    %A=A(:,120:end);
    [m n]=size(A);
%     if c==1
%         for i=1:m-1
%             if A(i,1)<10 && A(i+1,1)>50 && m0==0
%                 m0=i+1;
%             end
%             if A(i,1)>50 && A(i+1,1)<10 && m1==0
%                 m1=i;
%             end
%         end
%     end
%    [m n] = size(B);
    half=int32(n/2);
    B=A<120;
    %B=[A(:,1:half)<80 A(:,half+1:end)<50];
    r=zeros(1,4);
    n4=int32(n/4);
    for i=1:4
        b = B(:,(i-1)*n4+1:i*n4-4);
        r(i)=find_a_number(b);
    end
    f(c,:) = r;
    
end

ff=1000*f(:,1)+100*f(:,2)+10*f(:,3)+f(:,4);
ff=ff/100;
