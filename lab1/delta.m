clear
sepdata;
%nsepdata;
[insize, ndata] = size(patterns);
[outsize, ndata] = size(targets);
epochs=20;
eta=0.001;
W=randn(outsize, insize+1);
axis ([-2, 2, -2, 2], 'square');
indata = [patterns; ones(1, ndata)]; 
for epoch =1:epochs
    dW=-eta*(W*indata-targets)*indata';
    W=W+dW;
    p = W(1,1:2);
    k = -W(1, insize+1) / (p*p');
    l = sqrt(p*p');
    plot (patterns(1, find(targets>0)), ...
    patterns(2, find(targets>0)), '*', ...
    patterns(1, find(targets<0)), ...
    patterns(2, find(targets<0)), '+', ...
    [p(1), p(1)]*k + [-p(2), p(2)]/l, ...
    [p(2), p(2)]*k + [p(1), -p(1)]/l, '-');
    drawnow;
    %pause(0.3);
end