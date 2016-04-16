function main

x=0.01;
y=0.019998667;
w=200;
i=1;
while abs(sig(w*x)-y)>0.0001
    i=i+1;
    %w=-(sig(w*x)-y)/dsig(w*x)/x*0.5+w;
    w=-(sig(w*x)-y)*dsig(w*x)*0.5+w;
    fprintf('%d,%f\n',i,w);
end

end


function y=sig(x)
y=1/(1+exp(-x));
end

function y=dsig(x)
a=1+exp(-x);
y=exp(-x)/a/a;
end


