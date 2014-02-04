clear
x = [0:0.1:2*pi]';%inputs
f=square(2*x);%desired outputs
%units=5;
rvec=[];
for units=1:70
makerbf %output: m and var
Phi = calcPhi(x,m,var);
w=Phi\f;
y=Phi*w;
rvmax=max(abs(f-y));
rvec=[rvec rvmax];
%display(rvmax);
if rvmax<=0.1
    display(['0.1, ' num2str(units) ', ' num2str(rvmax)]);
end
if rvmax<=0.01
    display(['0.01, ' num2str(units) ', ' num2str(rvmax)]);
end
if rvmax<=0.001
    display(['0.001, ' num2str(units) ', ' num2str(rvmax)]);
end
end
figure(1);
rbfplot1(x,y,f,units);
figure(2);
plot(rvec);
ylabel('residual max')
xlabel('units')