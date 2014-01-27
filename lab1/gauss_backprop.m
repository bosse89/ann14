clear
%nsepdata;
gauss_approx;
hiddens=30;

epochs=50;
eta=0.1;
[insize, ndata] = size(patterns);
[outsize, ndata] = size(targets);
gridsize=xsize;
%first layer weights
w=randn(hiddens, insize+1);
%second layer weights
v=randn(outsize, hiddens+1);
dw=0;
dv=0;
alpha=0.9;
indata = [patterns; ones(1, ndata)]; 
for epoch =1:epochs
    
    %Step 1, forward
    hin = w * indata;
    hout = [2 ./ (1+exp(-hin)) - 1 ; ones(1,ndata)];
    oin = v * hout;
    out = 2 ./ (1+exp(-oin)) - 1;

    %Step 2, backwards
    delta_o = (out - targets) .* ((1 + out) .* (1 - out)) * 0.5;
    delta_h = (v' * delta_o) .* ((1 + hout) .* (1 - hout)) * 0.5;
    delta_h = delta_h(1:hiddens, :);

    %Step 3, update weights
    dw = (dw .* alpha) - (delta_h * indata') .* (1-alpha);
    dv = (dv .* alpha) - (delta_o * hout') .* (1-alpha);
    w = w + dw .* eta;
    v = v + dv .* eta;

    
    zz = reshape(out, gridsize, gridsize);
    mesh(x,y,zz);
    axis([-5 5 -5 5 -0.7 0.7]);
    drawnow;

end

