y=a(:,2);
s=fft(y);
abs_s=abs(s);
abs_s(1)=0;
m=length(s);
cutfun=ones(m,1);
cutfun(1:32)=0;
cutfun(50:m)=0;    %% 将 12 至m-12-1范围置 0，截断高频信号，保留低频信号。
%cutfun(265:m)=0;
ss=s.*cutfun;                  %% 对傅里叶变换信号做截断操作。
f=ifft(ss);                         %% 傅里叶逆变换。
real_f=real(f);                  %% 取实部
s=fft(y);
%plot(y,'b','linewidth',2);
%hold on
plot(real_f,'r','linewidth',1);      % 滤噪后的图像
xlabel('x')