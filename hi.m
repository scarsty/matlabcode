for i=[0.0015]% 0.002 0.0025 0.003 0.0035 0.0045 0.005]
    for j=[0]% 5 10 15 20 25 30 35 40 45 50 100]
        
        filename=[num2str(i) '/' num2str(j) '/' 'stat_result_file'];
        filename0=[num2str(i) '_' num2str(j) '.png'];
        filename1=['Rg_' filename0];
        filename2=['c_axis_' filename0];
        filename3=['Knot_' filename0];
        
        fid = fopen(filename);        
        k=1;
        c=1;
        A=zeros(1,2);
        while ~feof(fid)
            tline=fgetl(fid);
            if k>2
                a=textscan(tline, '%f %f %f %f %f %f %s');
                a0=cell2mat(a(1));
                a1=cell2mat(a(2:5));
                %if mod(a0,10000)==0
                    A(c,1)=a0;
                    A(c,2:5)=[a1(1) a1(2) a1(3) a1(4)];
                    c=c+1;
                %end
            end
            k=k+1;
        end
        hold off
        plot(A(:,1),A(:,2),'b');
        title(['流速: ' num2str(i) ' 刚性: ' num2str(j)]);
        xlabel('Step');
        ylabel('Rg');
        saveas(gcf,filename1);       
        %hold on
        
        %if mod(A(:,1),5000)==0
        l=1:5:c-1;
        hold off        
        errorbar(A(l,1),A(l,3),A(l,4),'r');
        hold on
        plot(A(l,1),A(l,3),'b');
        title(['流速: ' num2str(i) ' 刚性: ' num2str(j)]);
        xlabel('Step');
        ylabel('c_axis_dev');
        saveas(gcf,filename2);
        %end
        
        hold off
        for k=1:c-1
            if A(k,5)==0
                l=1:k;
                break
            end
        end
        plot(A(l,1),A(l,5),'b');
        title(['流速: ' num2str(i) ' 刚性: ' num2str(j)]);
        xlabel('Step');
        ylabel('Knot');
        saveas(gcf,filename3);       
        %hold on        
    end
end