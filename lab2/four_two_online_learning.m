clear
units=5;
x = [0:0.1:2*pi]';%inputs
f=sin(2*x);%desired outputs
eta= 0.1;
fun='sin2x';
makerbf %output: m and var
diter