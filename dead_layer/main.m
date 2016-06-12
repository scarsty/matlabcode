N=0;
T=397;
R=0;

global N
global T
i=1;
for N=[0 10.^(-5:0.1:0)];
    R=0;
    while R~=1
        Ds100=fminsearch(@F100,0.2);
        G100=F100(Ds100);
        Ds110=fminsearch(@F110,0);
        G110=F110(Ds110);
        Ds111=fminsearch(@F111,0);
        G111=F111(Ds111);
        
        T=T+0.1;
        Ds100r=fminsearch(@F100,0.2);
        G100r=F100(Ds100);
        Ds110r=fminsearch(@F110,0);
        G110r=F110(Ds110);
        Ds111r=fminsearch(@F111,0);
        G111r=F111(Ds111);
        T=T-0.1;
        
        if G100>0
            Ds100=0;
        end
        if G100r>0
            Ds100r=0;
        end
        
%         if G100<=G111 & G100r>G111r
%             R=1;
%             N1(i)=N
%             T1(i)=T
% %             G1(i)=G110
%             i=i+1;
%         end
%         if G100>G111
%             T=T-0.1;
%         end
%         if G100r<=G111r
%             T=T+0.1;
%         end
        if Ds100~=0 & Ds100r==0
            R=1;
            N1(i)=N
            T1(i)=T
%             G1(i)=G110
            i=i+1;
        end
        if Ds100==0
            T=T-0.1;
        end
        if Ds100r~=0
            T=T+0.1;
        end
    end
end
    