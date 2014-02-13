clear;
cities;

eta = 0.5;
epochs = 20;
neighbours = 3;
fneighbours = neighbours;
dneighbours = neighbours/epochs;

w = rand(10,2);

for epoch = 1:epochs
    for a = 1:10
        c = city(a,:);
        d = [];
        for i = 1:10
            d(i) = (c-w(i,:)) * (c-w(i,:))';% <== Correct???
        end
        [x,xi] = min(d);
        if neighbours >= 3
            i = cycle(xi-3,10);
            w(i,:) = w(i,:) + eta*( c-w(i,:) );
            i = cycle(xi+3,10);
            w(i,:) = w(i,:) + eta*( c-w(i,:) );
        end
        if neighbours >= 2
            i = cycle(xi-2,10);
            w(i,:) = w(i,:) + eta*( c-w(i,:) );
            i = cycle(xi+2,10);
            w(i,:) = w(i,:) + eta*( c-w(i,:) );
        end
        if neighbours >= 1
            i = cycle(xi-1,10);
            w(i,:) = w(i,:) + eta*( c-w(i,:) );
            i = cycle(xi+1,10);
            w(i,:) = w(i,:) + eta*( c-w(i,:) );
        end
        w(xi,:) = w(xi,:) + eta*( c-w(xi,:) );
    end
    fneighbours = fneighbours - dneighbours;
    neighbours = floor(fneighbours);
    
    tour = [w;w(1,:)];
    plot(tour(:,1),tour(:,2),'b-*',city(:,1),city(:,2),'r+');
    pause(0.3);
end
