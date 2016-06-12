% v=pinv(M(1:i+2,1:i+2))*b(1:i+2);
P=sparse(M);
v=P\b;
% for p=3:i+2
%     if coord(p,3)==1
%         V(coord(p,1),coord(p,2))=v(p);
%     end    
% end


R = (v(1)-v(2))/2;

% display(R);