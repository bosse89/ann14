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
Xd

% Distortions
distortion = [0 0 0 0 0 0 1 0]
Xd = vm(xor(t0(X),distortion(ones(1,3),:)))

% Distances
distances = abs(sum(sign(Xd-X),2))

% Apply update rule
updated = sgn(W*Xd')'

for mu=1:P
    if isequal(Xd(mu,:),X(mu,:))
        disp(['Xd',num2str(mu),' == X',num2str(mu)])
    end
    if isequal(updated(mu,:),X(mu,:))
        disp(['updated',num2str(mu),' == X',num2str(mu)])
    end
end