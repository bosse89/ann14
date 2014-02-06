clear
x = [0,0;0,1;1,0;1,1]
units = 2;
dmax = sqrt(2);
mu1 = [0 0];
mu2 = [1 1];
diff1 = repmat(mu1,size(x,1)); diff1 = diff1(:,1:2)
diff2 = repmat(mu2,size(x,1)); diff2 = diff2(:,1:2)
f = [0 1 1 0]';
phi1 = exp(-units/dmax^2*sum(abs(x-diff1).^2,2))
phi2 = exp(-units/dmax^2*sum(abs(x-diff2).^2,2))
Phi = [phi1,phi2]
%w = ((Phi'*f)\(Phi'*Phi))'