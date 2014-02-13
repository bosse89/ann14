% 
% 100 nodes, 84 attributes, 32 animals
% 

clear;
animals;

eta = 0.2;
epochs = 20;
neighbours = 50;
fneighbours = neighbours;
dneighbours = neighbours/epochs;
m = 100;
N = 84;
t = 32;

w = rand(m,N);
for epoch = 1:epochs
    for a = 1:t
        p = props(a,:);
        d = []; % Squared distances
        for i = 1:m
            d(i) = (p-w(i,:)) * (p-w(i,:))';% <== Correct???
        end
        [x,xi] = min(d);
        for i = max(1,xi-neighbours):min(m,xi+neighbours)
            w(i,:) = w(i,:) + eta*( p-w(i,:) );
        end
    end
    fneighbours = fneighbours - dneighbours;
    neighbours = floor(fneighbours);
end

pos = [];
for a = 1:t
    p = props(a,:);
    d = [];
    for i = 1:m
        d(i) = (p-w(i,:)) * (p-w(i,:))';% <== Correct???
    end
    [x,xi] = min(d);
    pos(a) = xi;
end
[dummy,order] = sort(pos);
snames(order)'