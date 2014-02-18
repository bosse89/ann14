clear
votesscript;
% votes: [349] x [31] -> {0,0.5,1}
% mpsex: [349] -> {0,1}
% mpparty: [349] -> [7]
% mpdistrict: [349] -> [29]

% Shuffle (dunno if it is neccessary)
permutation = randperm(349)';
tempvotes = votes;
for i=permutation
    tempvotes(i) = votes(i);
end
votes = tempvotes;

eta = 0.4;
epochs = 20;
neighbours = 10;
fneighbours = neighbours;
dneighbours = neighbours/epochs;
m = 10; % # rows
n = 10; % # cols
N = 31;  % # attributes (dimension)
t = 349;  % # training samples

pos = [];
w = rand(m*n,N);
for epoch = 1:epochs
    %display(neighbours);
    for a = 1:t
        p = votes(a,:);
        d = []; % Squared distances
        for i = 1:m*n
            d(i) = (p-w(i,:)) * (p-w(i,:))';% <== Correct???
        end
        [x,xi] = min(d);
        [x y]=ind2sub([10 10],xi);%pick coordinates from index
        neighs = getNeighbours([m,n],[x y],neighbours);
        for pair = neighs'
            i = sub2ind([10 10],x,y);%get index from coordinates
            w(i,:) = w(i,:) + eta*p-w(i,:);
        end
        pos(a) = xi;%last run will save best weightrow 
    end
    fneighbours = fneighbours - dneighbours;
    neighbours = floor(fneighbours);
end

a = ones(1,100)*350';
a(pos) = 1:349;
mpsexscript;
mppartyscript;
mpdistrictscript;

% We need to shuffle down here as well.
mpsex = mpsex(permutation);
mpparty = mpparty(permutation);
mpdistrict = mpdistrict(permutation);

figure(1);
p = [mpparty;0];
image(p(reshape(a,10,10))+1)
title('Party stats');
figure(2);
p = [mpsex;0];
image(p(reshape(a,10,10))+1)
title('Gender stats');
figure(3);
p = [mpdistrict;0];
image(p(reshape(a,10,10))+1)
title('District stats');