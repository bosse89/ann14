X = vm([0 0 1 0 1 0 0 1;0 0 0 0 0 1 0 0;0 1 1 0 0 1 0 1]);
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
Wij = Wij/N