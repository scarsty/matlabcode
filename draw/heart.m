[x,y,z]=meshgrid(linspace(-1.3,1.3,100));
val=(x.^2 + (9/4)*y.^2 + z.^2 - 1).^3 - x.^2.*z.^3 - (1/9)*y.^2.*z.^3;
p=patch(isosurface(x,y,z,val,0));
p.FaceColor = 'red';
p.EdgeColor = 'none';
axis equal
view(-10,24)
axis tight
camlight 
lighting gouraud