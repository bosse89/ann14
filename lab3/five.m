clear
votesscript;
mpsexscript;
mppartyscript;
mpdistrictscript;

% votes: [349] x [31] -> {0,0.5,1}
% mpsex: [349] -> {0,1}
% mpparty: [349] -> [7]
% mpdistrict: [349] -> [29]

eta = 0.2;
epochs = 20;
neighbours = 50;
fneighbours = neighbours;
dneighbours = neighbours/epochs;
m = 100; % # output nodes
N = 31;  % # attributes (dimension)
t = 349;  % # training samples

w = rand(m,N);
for epoch = 1:epochs
    for a = 1:t
        p = votes(a,:);
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
    p = votes(a,:);
    d = [];
    for i = 1:m
        d(i) = (p-w(i,:)) * (p-w(i,:))';% <== Correct???
    end
    [x,xi] = min(d);
    pos(a) = xi;
end
[dummy,order] = sort(pos);
snames(order)'