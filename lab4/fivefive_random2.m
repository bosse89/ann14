clear

X = sgn(randn(600,200));
N = size(X,2);
P = size(X,1);

distances = [];
%distances = zeros(D,P);

W = zeros(N,N);
for mu=1:P
    for i=1:N
        for j=1:N
            W(i,j) = W(i,j)+X(mu,i)*X(mu,j);
        end
    end
    Xd = sgn(W*X')';
    for i=1:(mu-1)
        for j=1:(mu-1)
            distances(i,j) = sum(sign(abs(Xd(i,:)-X(j,:))),2);
        end
    end
    if mu == 1
        continue
    end
    %distances
    stable(mu-1) = mu-1;
    for i=1:(mu-1)
        if min(distances(i,:)) ~= 0
            stable(mu-1) = stable(mu-1)-1;
        end
    end
    stable(mu-1) = stable(mu-1)/(mu-1);
end
W = W/N;
stable'
plot(stable)
