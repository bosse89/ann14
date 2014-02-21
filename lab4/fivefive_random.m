clear

pict;
% Attractors
X = [];
for i=1:125
    X = [X;sgn(randn(1,1024))];
end
N = size(X,2);
P = size(X,1);
W = X'*X;

Xd = zeros(P,N);
distortions = Xd;
D = size(Xd,1); % Number of test patterns
flippedbits = 128;
for i=1:D
    distortions(i,:) = flip(X(i,:),flippedbits);
    Xd(i,:) = distortions(i,:);
end

rows = min(P,3);

% Initial distances
distances = zeros(D,P);
for i=1:D
    for j=1:P
        distances(i,j) = sum(sign(abs(Xd(i,:)-X(j,:))),2);
    end
end
%initialdistances = distances

for i=1:rows
    subplot(rows,3,3*(i-1)+1); vis(X(i,:));
    title(sprintf('Stored patterns: %d',P))
    subplot(rows,3,3*(i-1)+2); vis(Xd(i,:));
    title(sprintf('Flipped bits: %d',flippedbits))
end

maxupdates = 5;
stable = [];
for update=1:maxupdates
    Xd = sgn(W*Xd')';
    for i=1:D
        for j=1:P
            distances(i,j) = sum(sign(abs(Xd(i,:)-X(j,:))),2);
        end
    end
    %distances
    pause(0.5)
    for i=1:rows
        subplot(rows,3,3*i); vis(Xd(i,:));
        title(sprintf('Update: %d',update))
    end
    converged = true;
    stable(update) = D;
    for i=1:D
        if min(distances(i,:)) ~= 0
            stable(update) = stable(update)-1;
            converged = false;
 %            break;
        end
    end
    stable(update)
    if converged
        break;
    end
end
stable = stable/D;

% If distances(i,j) == 0, row i in Xd corresponds to row j in X
correspondence = [];
for i=1:D
    for j=1:P
        if distances(i,j) == 0
            correspondence(i) = j;
        end
    end
end
%correspondence % The i:th test pattern corresponds to row correspondence(i) in X
%fiftyfive=stable
%sixtyfive=stable
%seventyfive=stable
%eightyfive=stable
%ninetyfive=stable
%hundredfive=stable
%hundredfifteen=stable
%hundredtwentyfive=stable
figure(2)
%axis([0 maxupdates 0 P]); hold on;
plot(stable)
%plot(fiftyfive); hold on;
%plot(sixtyfive)
%plot(seventyfive)
%plot(eightyfive)
%plot(ninetyfive)
%plot(hundredfive)
%plot(hundredfifteen)
%plot(hundredtwentyfive)
