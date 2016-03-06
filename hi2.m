% hi2

for i=[0.0015 0.002 0.0025 0.003 0.0035 0.0045 0.005]
    for j=[0 5 10 15 20 25 30 35 40 45 50 100]
        
        filename=[num2str(i) '/' num2str(j) '/' 'out'];
        fid = fopen(filename);
        c=1;
        A=zeros(1,2);
        knot=100;
        k=0;
        f=0;
        while ~feof(fid)
            tline=fgetl(fid);   
            if ~isempty(strfind(tline,'-----'))
                    k=k+1;;
                end
            % k>=2 means find the data
            if k>=2
                break;
            end
        end
        while ~feof(fid)
            for l=1:9
                tline=fgetl(fid);
                if ~isempty(strfind(tline,'trap'))
                    break;
                end
                if strcmp(tline,' ')==1
                    break
                end
                if l==1
                    a=textscan(tline, '%f %f');
                    t1=cell2mat(a(1));
                    t0=cell2mat(a(2));
                end
                if l==2
                    a=textscan(tline, '%f %f %f %f %f %f %f %f %s');
                    knot0=knot;
                    knot=cell2mat(a(7));
                    if knot==0 && knot0~=0 && f==0
                        f=cell2mat(a(1));
                    end
                end
            end
            if strcmp(tline,' ')==1
                break
            end
        end
        fclose(fid);
        
        r=0;
        if t1>0 &&t0>0
            if t0<f && f<t1
                r=1;
            end
            if f<t0
                r=2;
            end
            if f>t1
                r=4;
            end
        end
        if t0==-1
            r=5;
        end
        if t0>0 && t1==-1
            r=6;
        end
        fprintf('%f\t%f\t%d\n', i,j,r);
        
    end
end