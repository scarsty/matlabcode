str = 'E:\_s\simulation\sintering\littleangle-GBE\probability=exp\2\';

for i = 0:1000000:50000000
    L = dlmread([str 'L' int2str(i), '.txt']);
    OutputImage(L, [str 'L' int2str(i), '.png']);
end