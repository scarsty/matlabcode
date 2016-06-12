M=zeros(NN+2, NN+2);

for p=1:(NN+1)
for q=(p+1):(NN+2)
    
    if (coord(p,1)-coord(q,1))^2+(coord(p,2)-coord(q,2))^2+(coord(p,3)-coord(q,3))^2==1
        M(p,q)=1;
        M(q,p)=1;
        M(p,p)=M(p,p)-1;
        M(q,q)=M(q,q)-1;
    end
end
end
        
        
%         N(r, l)~=0
%     r1(1)=r-1;    l1(1)=l;
%     r1(2)=r;      l1(2)=l-1;
%     r1(3)=r+1;    l1(3)=l;
%     r1(4)=r;      l1(4)=l+1;
% %     r1(5)=r-1;    l1(5)=l;
% %     r1(6)=r-1;    l1(6)=l;
%     for t=1:4
%         if r1(t)>=1 & r1(t)<=m & l1(t)>=1 & l1(t)<=n
%             if N(r1(t), l1(t))~=0
%                 s = 1/(1/N(r1(t), l1(t))+1/N(r, l));
%                 M((r1(t)-1)*n+l1(t), (r-1)*n+l)=s;
%                 M((r-1)*n+l, (r1(t)-1)*n+l1(t))=s;
%                 M((r-1)*n+l, (r-1)*n+l)=M((r-1)*n+l, (r-1)*n+l)-s;
%             end
%         end
%     end
%     end
% end
% end
%     if r-1>0 
%         if N(r-1, l)~=0
%             s = (N(r-1, l)+N(r, l))/2;
%             M((r-1-1)*n+l, (r-1)*n+l)=s;
%             M((r-1)*n+l, (r-1-1)*n+l)=s;
%             M((r-1)*n+l, (r-1)*n+l)=M((r-1)*n+l, (r-1)*n+l)-s;
%         end
%     end
%     if r<m
%         if N(r+1, l)~=0
%             s = (N(r+1, l)+N(r, l))/2;
%             M((r-1+1)*n+l, (r-1)*n+l)=s;
%             M((r-1)*n+l, (r-1+1)*n+l)=s;
%             M((r-1)*n+l, (r-1)*n+l)=M((r-1)*n+l, (r-1)*n+l)-s;
%         end
%     end
%     if l>1
%         if N(r, l-1)~=0
%             s = (N(r, l-1)+N(r, l))/2;
%             M((r-1)*n+l-1, (r-1)*n+l)=s;
%             M((r-1)*n+l, (r-1)*n+l-1)=s;
%             M((r-1)*n+l, (r-1)*n+l)=M((r-1)*n+l, (r-1)*n+l)-s;
%         end
%     end
%     if l<n
%         if N(r, l+1)~=0
%             s = (N(r, l+1)+N(r, l))/2;
%             M((r-1)*n+l+1, (r-1)*n+l)=s;
%             M((r-1)*n+l, (r-1)*n+l+1)=s;
%             M((r-1)*n+l, (r-1)*n+l)=M((r-1)*n+l, (r-1)*n+l)-s;
%         end
%     end
%     end
%     
% end
% end