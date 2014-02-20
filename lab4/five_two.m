clear
pict

X = vm(pics);
%X = vm([0 0 1 0 1 0 0 1])
N = size(X,2); % (?)
P = size(X,1);
W = X'*X;

for i=1:N
    for j=1:N
        Wij(i,j) = 0;
        for mu=1:P
            Wij(i,j) = Wij(i,j) + X(mu,i)*X(mu,j);
        end
    end
end
Wij = Wij/N;

% W =/= Wij? Varför är det så?
% W verkar vara den som funkar korrekt att uppdatera med.

% Testpatterns:
Xd = [p11;p2];
subplot(2,2,1); vis(X(1,:));
subplot(2,2,3); vis(X(2,:));
subplot(2,2,2); vis(Xd(1,:));
subplot(2,2,4); vis(Xd(2,:));
pause(1)
for i = 1:10
    % Apply update rule
    Xd = sgn(Wij*Xd')'
    subplot(2,2,2); vis(Xd(1,:));
    subplot(2,2,4); vis(Xd(2,:));
    pause(0.1)
end