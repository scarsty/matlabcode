y=a(:,2);
s=fft(y);
abs_s=abs(s);
abs_s(1)=0;
m=length(s);
cutfun=ones(m,1);
cutfun(1:32)=0;
cutfun(50:m)=0;    %% �� 12 ��m-12-1��Χ�� 0���ضϸ�Ƶ�źţ�������Ƶ�źš�
%cutfun(265:m)=0;
ss=s.*cutfun;                  %% �Ը���Ҷ�任�ź����ضϲ�����
f=ifft(ss);                         %% ����Ҷ��任��
real_f=real(f);                  %% ȡʵ��
s=fft(y);
%plot(y,'b','linewidth',2);
%hold on
plot(real_f,'r','linewidth',1);      % ������ͼ��
xlabel('x')