% Function mainki

m = 20;
n = 20;
% f = 0;

tic
Times=500;
time=0;
NN=fix(m*n*5);

Rc=zeros(NN,1);
Rc1=zeros(m,m);
Rc3=Rc1;

s=0;

while time < Times

    coord=zeros(NN+2,3);
    %     coord(1,:)=[10,0,1];
    %     coord(2,:)=[m,n+1,1]; % Record every particle's x, y, z
    N = zeros(m,n); % N, the number of particles of each site.
    V = zeros(m,n); % V, the petsisnalls of each site.
    b = zeros(NN+2, 1); % b, the current vector.
    b(1) = -1;
    b(2) = 1;

    % ²¼ÖÃµ×²ã
    for i1=1:m
        for i2=1:n
            if mod(i1,2)==1 & (i2<2 | i2>n-1)
                N(i1,i2)=1;
            end
%             if mod(i1,4)==1
%                 N(i1,i2)=1;
%             end
%             if mod(i1,4)==2
%                 N(i1,i2)=2;
%             end
%             if mod(i1,4)==3
%                 N(i1,i2)=1;
%             end
            %             if mod(i1,2)==0 & ~(i2<=3 | i2>=n-2)
%                 N(i1,i2)=0;
%             end

        end
    end

    i=1;

    while i<=NN
        
        r = fix(1+m*rand(1));
        l = fix(1+n*rand(1)); % Build the x, y

%                 r=fix(mod(i, m*n)/n)+1;
%                 l=mod(mod(i, m*n),n)+1;

        N(r,l)=N(r,l)+1;
        coord(i+2,:)=[r,l,N(r,l)];
        i=i+1;

    end
%     buildM2
    
    
    for i1=(m/2):(m/2+1)
        for i2=1:m
            coord(1,:)=[i1,1,N(i1,1)+1];
            coord(2,:)=[i2,n,N(i2,n)+1];
%             buildM2
            buildM
            solveV
            Rct=1/R;
            if isnan(Rct) | isinf(Rct)
                Rct=0;
            end
            Rc1(i1,i2)=(time*Rc1(i1,i2)+Rct)/(time+1);
        end
    end
    
%         for i1=(m/2):(m/2+1)
%         for i2=1:m
%             coord(1,:)=[i1,1,N(i1,1)+1];
%             coord(2,:)=[i2,n,N(i2,n)+1];
%             buildM1
%             solveV
%             Rct=1/R;
%             if isnan(Rct) | isinf(Rct)
%                 Rct=0;
%             end
%             Rc3(i1,i2)=(time*Rc3(i1,i2)+Rct)/(time+1);
%         end
%     end

    % dlmwrite('Rc.txt',Rc);

    toc
    time=time+1

end


toc

Rc2=Rc1';


hold on

plot(1:m, Rc1(m/2,:),'r');
plot(1:m, Rc1(m/2+1,:),'b');





