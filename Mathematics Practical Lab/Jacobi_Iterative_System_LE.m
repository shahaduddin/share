% Jacobi Method
format long
clear all
clc
A=[4 3 0;3 4 -1;0 -1 4];b=[24;30;-24];xold=[1;1;1];
%A=[10 3 1;3 10 2;1 2 10]; 
%b=[19;29;35];
%A=input('Enter the coefficient Matrix A: ');
%b=input('Enter the RHS matrix b: ');
%A=[27 6 -1;6 15 2;1 1 54];
%b=[85; 72; 110];
maxerr=1e-3;
n=size(A,1);
x=zeros(1,size(A,1));
x=xold;
err=Inf;
itr=0;
while all (err>maxerr)
    itr=itr+1;
    xold=x;
    %for l=1:n
    for i=1:n
        sum=0;
        for j=1:n
            if j~=i
                sum=sum+A(i,j)*xold(j);
            end
        end
        x(i)=(1/A(i,i))*(b(i)-sum);
        err(i)=max(abs(xold(i)-x(i)));
    end
    %itr=itr+1;
    table(itr,:)=x
    Error_Table(itr,:)=err
    %err=abs(xold'-x')
    %end
end
fprintf('Solution converge %d iteration\n', itr)
Solution=[x'];

%fileName=['Table_Jacobi' '.txt'];
%save(fileName, 'table', '-tabs', '-ascii')

ITR=1:1:itr;
plot(1:1:itr, Error_Table(:,3),'r-o');



