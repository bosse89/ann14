clear
x = [0,0;0,1;1,0;1,1]
units = 2;
dmax = sqrt(2);
mu1 = [0 0];
mu2 = [1 1];
f = [0 1 1 0]';

diff1 = repmat(mu1,size(x,1)); diff1 = diff1(:,1:2);
diff2 = repmat(mu2,size(x,1)); diff2 = diff2(:,1:2);
phi1 = exp(-units/dmax^2*sum(abs(x-diff1).^2,2));
phi2 = exp(-units/dmax^2*sum(abs(x-diff2).^2,2));

Phi = [phi1,phi2]
%w = ((Phi'*f)\(Phi'*Phi))'
%y00 = w(1)*Phi(1,1)+w(2)*Phi(2,1)

% Plot linsep
hold on; grid;
xlim([-0.1 1.1]);
ylim([-0.1 1.1]);
xlabel('phi_1');
ylabel('phi_2');
plot(Phi(2:3,1),Phi(2:3,2),'r*');
plot([Phi(1,1);Phi(4,1)],[Phi(1,2);Phi(4,2)],'b*');
plot([-0.3,1.2],[1.2,-0.3],'k')