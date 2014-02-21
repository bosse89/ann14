clear all
close all
pict

X = [p1;p2;p3];
N = size(X,2);%units =1024
P = size(X,1);%patterns=3
W = X'*X;
W = p1'*p1 + p2'*p2 + p3'*p3; %learning first three

figure(1);
% Testpatterns:
Xd = [p11;p22];
subplot(3,2,1); vis(X(1,:));
title('p1');
subplot(3,2,3); vis(X(2,:));
title('p2');
subplot(3,2,5); vis(X(3,:));
title('p3');
subplot(3,2,2); vis(Xd(1,:));
title('p11 degraded of p1');
subplot(3,2,4); vis(Xd(2,:));
title('p22 mix of p2 & p3');
%pause(1)
figure(2);
D=size(Xd,1);
ri=randperm(1024);
E=[];
for k=1:10
for i = 1:size(ri)
    for j= 1:D        
        % Apply update rule
        figure(2);
        %Xd(j,:)=sgn(W(:,ri(i)).*Xd(j,:)')'
        temp=sgn(Xd*W');
        Xd(j,ri(i))=temp(ri(i));
        %Xd = sgn(W(:,ri(i))*Xd')'
        subplot(2,2,2); 
        vis(Xd(1,:));
        title('Recall from p11');
        subplot(2,2,4); 
        vis(Xd(2,:));
        title('Recall from p22');
        %pause(0.1)
        %drawnow;
        E=[E energy(Xd,W)];
    end
end
figure(3);
plot(E');

title('Energy');
