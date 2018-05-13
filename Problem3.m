clear all;
close all;
D=[ 0 1 sqrt(5) sqrt(5) 2;
    1 0 sqrt(2) 2 sqrt(5);
    sqrt(5) sqrt(2) 0 sqrt(2) sqrt(5);
    sqrt(5) 2 sqrt(2) 0 1;
    2 sqrt(5) sqrt(5) 1 0];
D_square=D.*D;
J=eye(5)-(1/5)*ones(5,5);
Bdelta=(-1/2)*J*D_square*J;
[V,lambda]=eig(Bdelta);
coordinate=[V(:,1)*sqrt(lambda(1,1)),V(:,2)*sqrt(lambda(2,2)),V(:,3)*sqrt(lambda(3,3))];
coordinate=real(coordinate);

Verify_D=zeros(5,5);
for i=1:5
    for j=1:5
        Verify_D(i,j)=norm(coordinate(i,:)-coordinate(j,:));
    end
end



