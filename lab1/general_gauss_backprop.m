clear
%nsepdata;
%gauss_approx;

x=[-5:1:5]';
y=x;
z=exp(-x.*x*0.1) * exp(-y.*y*0.1)' - 0.5;
figure(2);
mesh (x, y, z);
gridsize = size(x, 1);
ndata = gridsize*gridsize;
targets = reshape (z, 1, ndata);
[xx, yy] = meshgrid (x, y);
patterns = [reshape(xx, 1, ndata); reshape(yy, 1, ndata)];

permute = randperm(size(patterns,2));
[dummy, perm_col] = sort(permute);
patterns = patterns(:, permute);
targets = targets(:, permute);
n=25;

patterns_sample = patterns(:, [1:1:n]);
targets_sample = targets(:, [1:1:n]);


hiddens=20;

epochs=200;
eta=0.1;
[insize, ndata] = size(patterns);
[outsize, ndata] = size(targets);
[insize, ndata_sample] = size(patterns_sample);
[outsize, ndata_sample] = size(targets_sample);

%first layer weights
w=randn(hiddens, insize+1);
%second layer weights
v=randn(outsize, hiddens+1);
dw=0;
dv=0;
alpha=0.9;
indata_sample = [patterns_sample; ones(1, ndata_sample)]; 
indata = [patterns; ones(1, ndata)]; 
for epoch =1:epochs
    
    %Step 1, forward
    hin = w * indata_sample;
    hout = [2 ./ (1+exp(-hin)) - 1 ; ones(1,ndata_sample)];
    oin = v * hout;
    out = 2 ./ (1+exp(-oin)) - 1;
    
    %Step 2, backwards
    delta_o = (out - targets_sample) .* ((1 + out) .* (1 - out)) * 0.5;
    delta_h = (v' * delta_o) .* ((1 + hout) .* (1 - hout)) * 0.5;
    delta_h = delta_h(1:hiddens, :);

    %Step 3, update weights
    dw = (dw .* alpha) - (delta_h * indata_sample') .* (1-alpha);
    dv = (dv .* alpha) - (delta_o * hout') .* (1-alpha);
    w = w + dw .* eta;
    v = v + dv .* eta;

    %Step 4, forward2
    hin = w * indata;
    hout = [2 ./ (1+exp(-hin)) - 1 ; ones(1,ndata)];
    oin = v * hout;
    out = 2 ./ (1+exp(-oin)) - 1;
    
    
    out2 = out(:, perm_col);
    zz = reshape(out2, gridsize, gridsize);
    mesh(x,y,zz);
    axis([-5 5 -5 5 -0.7 0.7]);
    drawnow;

end

