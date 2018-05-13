clear all;
close all;
C1=[1 1 1 0;
    1 1 1 0;
    1 1 1 1;
    1 0 1 0;
    0 1 0 0;
    0 0 1 1;
    0 0 0 1;
    0 0 0 0];
[a,b]=size(C1);
E1=zeros(a,1);
T1=zeros(a,1);
K1=zeros(a,b);
trans=zeros(a,b);
trans_=zeros(a,b);
N1=[4 4 5 3];

%Calculating W1
for j=1:b
    summa1(j)=(1/j)*log2(1/j);
end
sum1=sum(summa1);
for i=1:a
    T1(i)=sum(C1(i,:));
end
for i=1:a-1
    trans(i,:)=C1(i,:)./T1(i);
end
trans(8,:)=[0 0 0 0];
for i=1:a
    for j=1:b
        if trans(i,j)==0;
            trans_(i,j)=0;
        else
            trans_(i,j)=log2(trans(i,j));
        end
    end
end
for i=1:a
    E1(i)=sum(trans(i,:).*trans_(i,:))/sum1;
    for j=1:b
        if C1(i,j)==0;
            K1(i,j)=0;
        else
            K1(i,j)=(1-E1(i))*C1(i,j)/N1(j);
        end
    end
end

[U,S,V]=svd(K1);

Wj=zeros(8,4);
S1=zeros(8,4);
S1(1,1)=S(1,1);
S1(2,2)=S(2,2);
SV=S1*V';
Wj=U*S1*V';
%scaled document vectors

C2=zeros(8,5);
for i=1:8
    for j=1:4
    C2(i,j)=C1(i,j);
    end
end
C2(:,5)=[0 1 1 0 0 1 0 1];

E2=zeros(a,1);
T2=zeros(a,1);
W2=zeros(a,b+1);
trans2=zeros(a,b+1);
trans_2=zeros(a,b+1);
N2=[4 4 5 3 4];

%Calculating new W2 after adding a new document
for j=1:b+1
    summa2(j)=(1/j)*log2(1/j);
end
sum2=sum(summa2);
for i=1:a
    T2(i)=sum(C2(i,:));
end
for i=1:a
    trans2(i,:)=C2(i,:)./T2(i);
end
for i=1:a
    for j=1:b+1
        if trans2(i,j)==0;
            trans_2(i,j)=0;
        else
            trans_2(i,j)=log2(trans2(i,j));
        end
    end
end
for i=1:a
    E2(i)=sum(trans2(i,:).*trans_2(i,:))/sum2;
    for j=1:b+1
        if C2(i,j)==0;
            W2(i,j)=0;
        else
            W2(i,j)=(1-E2(i))*C2(i,j)/N2(j);
        end
    end
end

VP=U'*W2(:,5);

D1=norm(W2(:,5)-W2(:,1));
D2=norm(W2(:,5)-W2(:,2));
D3=norm(W2(:,5)-W2(:,3));
D4=norm(W2(:,5)-W2(:,4));


