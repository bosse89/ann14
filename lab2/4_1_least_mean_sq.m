x = [0:0.1:2*pi]';
f=sin(2*x);
units=3;
makerbf
%m and var
Phi = calcPhi(x,m,var);

w=f\Phi;
y=Phi*w;
rbfplot1(x,y,f,units);
