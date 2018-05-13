clear all;
close all;
iteration=30;
A=load('Matrix_A.dat');
W=load('Matrix_W.dat');
H=ones(2,150);
H1=zeros(2,150,iteration);
error=zeros(iteration);
H1(:,:,1)=H.*((W'*A)./(W'*W*H));
error(1)=norm((A-W*H1(:,:,1)),'fro')/sqrt(4*150);
figure;
plot(1,error(1));
hold on;
for i=2:iteration
    H1(:,:,i)=H1(:,:,i-1).*((W'*A)./(W'*W*H1(:,:,i-1)));
    error(i)=norm((A-W*H1(:,:,i)),'fro')/sqrt(4*150);
    plot(i,error(i),'*');
    hold on;
end
title('error vs iteration plot');