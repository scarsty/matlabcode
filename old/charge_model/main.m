% Coefficients
bb='-8.388e8';
cc='7.764e9';
dd='3.090e11';
P0='0.26';

% Conditions and main loop
tic
for R=[10 160]
for sigma=[0.5 1]
for N0=[5]
for T=[350]
    
    aa=num2str(8.248e5*(T-388));
    
    R_s=num2str(R);
    sigma_s=num2str(sigma);
    N0_s=num2str(N0);
    T_s=num2str(T);    
   
    % Bipolar solution and save it, in this case j=1
    j=1;
    [R_s 'nm, ' sigma_s 'Po, ' N0_s 'e23, ' T_s 'K, ' num2str(j)]
    initial='sigma/P0*(1-x)';
    new_BT_8;
    save_new;
    
    % Unipolar solution (or solutions) and save it (or them), 
    % in this case j=2 or j=3 (if it exist)
    % Solve Ds, here b is always negative
    s=[aa bb '*x+' cc '*x^2+' dd '*x^3'];
    xx=sqrt(double(solve(s,'x')));
    % If x solved is a real, it should be what we need
    for i=1:3
        if abs(imag(xx(i)))<1e-10;
            j=j+1;
            [R_s 'nm, ' sigma_s 'Po, ' N0_s 'e23, ' T_s 'K, ' num2str(j)]
            initial=['.68+sigma/P0*(1-x)'];
            new_BT_8;
            save_new;            
        end
    end
    
end
end
end
end

toc