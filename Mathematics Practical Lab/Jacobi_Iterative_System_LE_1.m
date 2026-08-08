%Jacobi Iterative method
clear all
close all
clc
A=input('Enter the coefiicient Matrix A: ');
B=input('Enter the RHS vector B: ');
X0=input('Enter the initial solution: '); % column vector
n=input('Maximum no. of iterations: ');
Err=input('Put the tollerance: ');
N=length(B);
X=zeros(N,1);
for j=1:n
    for i=1:N
        X(i)=(B(i)/A(i,i))-(A(i,[1:i-1,i+1:N])*X0([1:i-1,i+1:N]))/A(i,i);
    end
    fprintf('Iteration no %d\n', j)
    X;
    B=X;
    if abs(X-X0)<Err
        break
    end
    P=X
end