function sigma = fitpercolation (x, pdata)

sigma = x(1) * (pdata-x(2)).^x(3);
