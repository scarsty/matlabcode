% FEMLAB Model M-file
% Generated by FEMLAB 3.1 (FEMLAB 3.1.0.157, $Date: 2004/11/12 07:39:54 $)

flclear fem

% Femlab version
clear vrsn
vrsn.name = 'FEMLAB 3.1';
vrsn.ext = '';
vrsn.major = 0;
vrsn.build = 157;
vrsn.rcs = '$Name:  $';
vrsn.date = '$Date: 2004/11/12 07:39:54 $';
fem.version = vrsn;

% Geometry
clear g1
g2=solid1([0,2]);
clear s
s.objs={g2};
s.name={'I1'};
s.tags={'g2'};

fem.draw=struct('s',s);
fem.geom=geomcsg(fem);

% Initialize mesh
fem.mesh=meshinit(fem);

% Refine mesh
fem.mesh=meshrefine(fem,'mcase',0);
fem.mesh=meshrefine(fem,'mcase',0);
fem.mesh=meshrefine(fem,'mcase',0);
fem.mesh=meshrefine(fem,'mcase',0);
fem.mesh=meshrefine(fem,'mcase',0);
fem.mesh=meshrefine(fem,'mcase',0);


% Constants
fem.const={'R',[R_s '*R0'],'sigma',[sigma_s ' *P0'],'T',T_s,'ff','1.38e-11','P0','0.26',...
    'q','-1.602e-19','N0',[N0_s ' *1e23'],'k','1.38e-23','R0','1e-9','z','2','dd',dd,...
    'cc',cc,'bb',bb,'aa',aa,'eps0','8.854e-12',...
    'a11','-2.097e8','a111','1.294e9','a12','7.974e8','a112','-1.95e9','a123','-2.5e9',...
    'a1111','3.863e10','a1112','2.529e10','a1122','1.637e10','a1123','1.367e10'};

% (Default values are not included)

% Application mode 1
clear appl
appl.mode.class = 'FlPDEC';
appl.dim = {'D','D_t'};
appl.assignsuffix = '_c';
clear bnd
bnd.type = 'neu';
bnd.ind = [1,1];
appl.bnd = bnd;
clear equ
equ.init = {{initial;0}};
equ.c = 'k*T*P0/R/R+(ff*P0/R/R)*((q*P0/R)*Dx+z*N0*q*q)';
equ.a = '(z*N0*q*q)*(aa*P0+(bb*P0^3)*D^2+(cc*P0^5)*D^4+(dd*P0^7)*D^6)';
equ.f = 0;
equ.be = '(q*P0/R)*((aa*P0)*D+(bb*P0^3)*D^3+(cc*P0^5)*D^5+(dd*P0^7)*D^7)+(ff*P0/R/R)*(q*P0/R)*diff(Dx,x)';
equ.ind = [1];
appl.equ = equ;
fem.appl{1} = appl;
fem.border = 1;
fem.outform = 'general';

% Coupling variable elements
clear elem
elem{1} = struct('elem',{'elcplextr'},'var',{{'c1','c2','c2','c1'}},'g',{{'1'}},'src',{{{struct('expr',{{{{}},{{}},{'Dx'},{'D'}}},'map',{{'0','0','0','0'}},'ind',{{{'1','2'}}}),{}}}},'geomdim',{{{struct('map',{{{{},{}},{{},{}},{{},'1'},{{},'1'}}},'ind',{{{'1'},{'2'}}}),{},{}}}},'map',{{struct('type',{'linear'},'sg',{'1'},'sv',{{'2'}},'dg',{'1'},'dv',{{'1'}})}});
elem{2} = struct('elem',{'elpconstr'},'g',{{'1'}},'geomdim',{{{struct('constr',{{{'c2-(Dx)','c1-(D+2*sigma/P0)'}}},'cpoints',{{{'2','2'}}},'ind',{{{'2'}}}),{}}}});
fem.elemcpl = elem;

% Multiphysics
fem=multiphysics(fem);

% Extend mesh
fem.xmesh=meshextend(fem);

% Evaluate initial value using current solution
% if n~=1
%     init = init0(i1);
% end

% Solve problem
maxi=50;

fem.sol=femnlin(fem, ...
    'Maxiter',maxi,...
    'solcomp',{'D'}, ...
    'outcomp',{'D'});

% switch i1
%     case 1
%         if exist('init1')==0 | Ds~=0
%             fem.sol=femnlin(fem, ...
%                 'Maxiter',maxi,...
%                 'solcomp',{'D'}, ...
%                 'outcomp',{'D'});
%         else
%             fem.sol=femnlin(fem, ...
%                 'init',init1,...
%                 'Maxiter',maxi,...
%                 'solcomp',{'D'}, ...
%                 'outcomp',{'D'});
%         end
%     case 2
%         if exist('init2')==0 | Ds~=0
%             fem.sol=femnlin(fem, ...
%                 'Maxiter',maxi,...
%                 'solcomp',{'D'}, ...
%                 'outcomp',{'D'});
%         else
%             fem.sol=femnlin(fem, ...
%                 'init',init2,...
%                 'Maxiter',maxi,...
%                 'solcomp',{'D'}, ...
%                 'outcomp',{'D'});
%         end
%     case 3
%         if exist('init3')==0 | Ds~=0
%             fem.sol=femnlin(fem, ...
%                 'Maxiter',maxi,...
%                 'solcomp',{'D'}, ...
%                 'outcomp',{'D'});
%         else
%             fem.sol=femnlin(fem, ...
%                 'init',init3,...
%                 'Maxiter',maxi,...
%                 'solcomp',{'D'}, ...
%                 'outcomp',{'D'});
%         end
% end

            
stop=femnlin(fem, 'Out','stop');

% Save current fem structure for restart purposes
fem0=fem;

% Plot solution
% postplot(fem, ...
%          'liny',{'D','cont','internal'}, ...
%          'lindata','D', ...
%          'linmap','jet(1024)', ...
%          'title','Line: D', ...
%          'refine',3, ...
%          'axis',[-0.1,2.1,-0.0618436396121979,1.29871643185616,-1,1]);
