clear

pict
% Attractors
X = [p1;p2;p3];
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

rows = min(P,P);

% Initial distances
distances = zeros(D,P);
for i=1:D
    for j=1:P
        distances(i,j) = sum(sign(abs(Xd(i,:)-X(j,:))),2);
    end
end
initialdistances = distances

for i=1:rows
    subplot(rows,3,3*(i-1)+1); vis(X(i,:));
    title(sprintf('Stored patterns: %d',P))
    subplot(rows,3,3*(i-1)+2); vis(Xd(i,:));
    title(sprintf('Flipped bits: %d',flippedbits))
end

maxupdates = 5;
for update=1:maxupdates
    Xd = sgn(W*Xd')';
    for i=1:D
        for j=1:P
            distances(i,j) = sum(sign(abs(Xd(i,:)-X(j,:))),2);
        end
    end
    distances
    pause(0.5)
    for i=1:rows
        subplot(rows,3,3*i); vis(Xd(i,:));
        title(sprintf('Update: %d',update))
    end
    converged = true;
    for i=1:D
        if min(distances(i,:)) ~= 0
            converged = false;
            break;
        end
    end
    if converged
        break;
    end
end

% If distances(i,j) == 0, row i in Xd corresponds to row j in X
correspondence = [];
for i=1:D
    for j=1:P
        if distances(i,j) == 0
            correspondence(i) = j;
        end
    end
end
correspondence % The i:th test pattern corresponds to row correspondence(i) in X
