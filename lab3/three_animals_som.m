% 
% 100 nodes, 84 attributes, 32 animals
% 

clear;
animals;

epochs = 20;
w = rand(100,84);

for epoch = 1:epochs
    for a = 1:32
        p = props(a,:);
        d = [];
        for i = 1:100
            d(i) = (p-w(i,:)) * (p-w(i,:))';
        end
        [x,i] = min(d);
    end
end