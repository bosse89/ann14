clear
votesscript;
% votes: [349] x [31] -> {0,0.5,1}
% mpsex: [349] -> {0,1}
% mpparty: [349] -> [7]
% mpdistrict: [349] -> [29]

eta = 0.2;
epochs = 20;
neighbours = 50;
fneighbours = neighbours;
dneighbours = neighbours/epochs;
m = 10; % # rows
n = 10; % # cols
N = 31;  % # attributes (dimension)
t = 349;  % # training samples

w = rand(m*n,N);
for epoch = 1:epochs
    for a = 1:t
        p = votes(a,:);
        d = []; % Squared distances
        for i = 1:m*n
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
    for i = 1:m*n
        d(i) = (p-w(i,:)) * (p-w(i,:))';% <== Correct???
    end
    [x,xi] = min(d);
    pos(a) = xi;
end

[x,y] = meshgrid([1:m],[1:n]);
xpos = reshape(x,1,m*n)';
ypos = reshape(y,1,m*n)';

a = ones(1,100)*350';
a(pos) = 1:349;
a'

%mpsexscript;
mppartyscript;
%mpdistrictscript;
p = [mpparty;0];
image(p(reshape(a,10,10))+1)