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
Xd = [1 0 1 0 1 0 0 1;1 1 0 0 0 1 0 0;1 1 1 0 1 1 0 1];
Xd
% Initial distances
distances = abs(sum(sign(Xd-X),2))

maxupdates = 10;
for update=1:maxupdates
    if isequal(distances,zeros(P,1))
        break
    end
    % Apply update rule
    Xd = sgn(W*Xd')'
    % Distances after updating
    distances = abs(sum(sign(Xd-X),2))
end