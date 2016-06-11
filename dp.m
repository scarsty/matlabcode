%画概率图
p1=imresize(p,10,'bicubic');
mesh(p1);
xlim([5 35]);
ylim([5 105]);
set(gca,'XTick',[0:3]*10+5)
set(gca,'YTick',[0:10:100]+5)
set(gca,'XTickLabel',[0.01 0.02 0.03 0.04])
set(gca,'YTickLabel',[0:10:100])
xlabel('ve');
ylabel('stiffness');
zlabel('pro');
