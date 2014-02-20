%X = vm([0 0 1 0 1 0 0 1;0 0 0 0 0 1 0 0;0 1 1 0 0 1 0 1]);
X = vm([0 0 1 0 1 0 0 1])
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

test = X(1,:);
test(1:5) = 1
updated = sgn(Wij*test')'

for mu=1:P
    if isequal(test,X(mu,:))
        disp(['test and X',num2str(mu),' are equal'])
    end
    if isequal(updated,X(mu,:))
        disp(['updated and X',num2str(mu),' are equal'])
    end
end