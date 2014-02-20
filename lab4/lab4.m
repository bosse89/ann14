clear

X = vm([0 0 1 0 1 0 0 1;0 0 0 0 0 1 0 0;0 1 1 0 0 1 0 1])
%X = vm([0 0 1 0 1 0 0 1])
N = size(X,2); % (?)
P = size(X,1);
W = X'*X

for i=1:N
    for j=1:N
        Wij(i,j) = 0;
        for mu=P
            Wij(i,j) = Wij(i,j)+X(mu,i)*X(mu,j);
        end
    end
end
%Wij = Wij/N;
Wij

% W =/= Wij? Varför är det så?
% W verkar vara den som funkar korrekt att uppdatera med.

% Testpatterns:
Xi = X;
Xi(1,1) = 1; % En liten mutation för att se om det funkar ändå
Xi
updated = sgn(W*Xi')'

for mu=1:P
    if isequal(X(mu,:),X(mu,:))
        disp(['Xi',num2str(mu),' == X',num2str(mu)])
    end
    if isequal(updated(mu,:),X(mu,:))
        disp(['updated',num2str(mu),' == X',num2str(mu)])
    end
end