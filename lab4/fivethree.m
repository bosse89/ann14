clear all
close all
pict

X = vm([p1;p2;p3]);
N = size(X,2);%units =1024
P = size(X,1);%patterns=3
W = X'*X;
W=W/N;
%W = p1'*p1 + p2'*p2 + p3'*p3; %learning first three
%attractors
E1=X(1,:)*W*X(1,:)'
E2=X(2,:)*W*X(2,:)'
E3=X(3,:)*W*X(3,:)'


Xd = [p11;p22];

%distorded
Ed11=Xd(1,:)*W*Xd(1,:)'
Ed22=Xd(2,:)*W*Xd(2,:)'

