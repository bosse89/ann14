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

w = rand(100,84);
for epoch = 1:epochs
    for a = 1:32
        p = props(a,:);
        d = [];
        for i = 1:100
            d(i) = (p-w(i,:)) * (p-w(i,:))';% <== Correct???
        end
        [x,xi] = min(d);
        for i = max(1,xi-neighbours):min(100,xi+neighbours)
            w(i,:) = w(i,:) + eta*( p-w(i,:) );
        end
    end
    fneighbours = fneighbours - dneighbours;
    neighbours = floor(fneighbours);
end

pos = [];
for a = 1:32
    p = props(a,:);
    d = [];
    for i = 1:100
        d(i) = (p-w(i,:)) * (p-w(i,:))';% <== Correct???
    end
    [x,xi] = min(d);
    pos(a) = xi;
end
[dummy,order] = sort(pos);
snames(order)'