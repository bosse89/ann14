clear all
close all
pict
figure(1);

X = [p1;p2;p3];
N = size(X,2);%units =1024
P = size(X,1);%patterns=3
W = X'*X;
%W = p1'*p1 + p2'*p2 + p3'*p3; %learning first three

for i=1:N
    for j=1:N
        Wij(i,j) = 0;
        for mu=1:P
            Wij(i,j) = Wij(i,j) + X(mu,i)*X(mu,j);
        end
    end
end
Wij = Wij/N;
%W=W/N;
% Testpatterns:
Xd = [flip(p1,0)];
for d = 10:10:1000
    Xd_prev = Xd;
    Xd = [flip(p1,d)];
    E=[];
    ri=randperm(1024);
    ri([1:10]);
    for i = 1:100
        ri=randperm(1024);
        subi=ri([1:100]);
        % Apply update rule
        tempXd = sgn(W*Xd')'; % Borde inte använda random i denna uppg?
        Xd(subi)=tempXd(subi);
        E=[E -Xd(1,:)*W*Xd(1,:)'];
    end
    subplot(10,10,ceil(d/10))
    vis(Xd(1,:));
    set(gca, 'XTick', []);
    set(gca, 'YTick', []);
    title(d);
%     if isequal(X(1,:),Xd) == false
%         break
%     end
end

% subplot(1,2,2)
% vis(Xd(1,:));
% title(d);
% figure();
% plot(E');
% title('Energy');
