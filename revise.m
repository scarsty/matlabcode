% [9,3]=size(A);
% b=[50,100,200];
% for i=1:3
%     for j=1:3
%         k=i+(j-1)*3;
%     A(k,1)=i;
%     A(1:3:7,2)=50;
%     A(2:3:8,2)=100;
%     A(3:3:9,2)=200;
%     A(k,3)=A(k,2)/(pi*A(k,1)^2);
%     end
% end
% contour(A)

A=0;
for i=10:20
    for j=1:21
        x=(j-1)*10;
        y=i/5;
        A(i,j)=x/y^2/pi;
    end
end
surf(A);
axis([1 21 10 20 0 20]); 
set(gca,'XTick',1:5:21)
set(gca,'YTick',10:5:20)
set(gca,'XTickLabel',0:50:200)
set(gca,'YTickLabel',2:1:4)
xlabel('N');
ylabel('R');
zlabel('N/\piR^2');
set(gca,'fontsize',15)
set(gca,'fontname','Times New Roman')
set(gca,'XTickLabel','FontSize',5);
set(gca,'YTickLabel','FontSize',5);
