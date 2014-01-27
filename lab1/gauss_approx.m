x=[-5:1:5]';
y=x;
z=exp(-x.*x*0.1) * exp(-y.*y*0.1)' - 0.5;
figure(2);
mesh (x, y, z);
xsize = size(x, 1);
ysize = size(x, 1);
ndata=xsize*ysize;
targets = reshape (z, 1, ndata);
[xx, yy] = meshgrid (x, y);
patterns = [reshape(xx, 1, ndata); reshape(yy, 1, ndata)];
