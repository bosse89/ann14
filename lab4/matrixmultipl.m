%checking so that matrixmultiplications in fivethree are correct
mat=[1 2 3;4 5 6; 7 8 9];
x=[1 2 3];
sum=0;
for i= 1:3
    for j=1:3
        sum=sum+mat(i,j)*x(i)*x(j);
        
    end
    
end
sum;

E=x*mat*x';
