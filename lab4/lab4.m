clear

X = vm([0 0 1 0 1 0 0 1;0 0 0 0 0 1 0 0;0 1 1 0 0 1 0 1])
%X = vm([0 0 1 0 1 0 0 1])
N = size(X,2); % (?)
P = size(X,1);
W = X'*X;

for i=1:N
    for j=1:N
        Wij(i,j) = 0;
        for mu=P
            Wij(i,j) = Wij(i,j)+X(mu,i)*X(mu,j);
        end
    end
end
Wij = Wij/N;

% W =/= Wij? Varför är det så?
% W verkar vara den som funkar korrekt att uppdatera med.

% Testpatterns:
Xd = X;
% Distort
%distortion = [1 0 0 0 0 0 0 0]
%Xd = vm(xor(t0(X),distortion(ones(1,3),:)));
Xd = vm([1 0 1 0 1 0 0 1;1 1 0 0 0 1 0 0;1 1 1 0 1 1 0 1]);
D = size(Xd,1); % Number of test patterns
Xd
% Initial distances
distances = zeros(D,P);
for i=1:D
    for j=1:P
        distances(i,j) = sum(sign(abs(Xd(i,:)-X(j,:))),2);
    end
end
initialdistances = distances

maxupdates = 2;
for update=1:maxupdates
    % Apply update rule
    Xd = sgn(W*Xd')'
    % Distances after updating
    for i=1:D
        for j=1:P
            distances(i,j) = sum(sign(abs(Xd(i,:)-X(j,:))),2);
        end
    end
    distances
end