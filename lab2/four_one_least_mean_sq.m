clear
x = [0:0.1:2*pi]';%inputs
f=sin(2*x);%desired outputs
units=6;
%for units=6:6
for units=units:units
    makerbf %output: m and var
    Phi = calcPhi(x,m,var);
    w=Phi\f;
    y=Phi*w;
    rvmax=max(abs(f-y));
    %display(rvmax);
    if rvmax<=0.1
        display(['0.1, ' num2str(units)]);
    end
    if rvmax<=0.01
        display(['0.01, ' num2str(units)]);
    end
    if rvmax<=0.001
        display(['0.001, ' num2str(units)]);
    end
end
rbfplot1(x,y,f,units);

% Display points roughly corresponding to the approximation.
xapprox = [x(1):(x(end)-x(1))/(units-1):x(end)]
yapprox = []
for xx=xapprox
    [amin,argmin] = min(abs(x-xx))
    yy = f(argmin)
    yapprox = [yapprox yy]
end
subplot(2,1,1); hold on;
plot(xapprox,yapprox,'r*');
