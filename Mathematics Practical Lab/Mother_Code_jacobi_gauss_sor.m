function Mother_Code_jacobi_gauss_sor()
format long;
a=input('Enter a co-efficient Matrix A (eg,[10 3 1;3 10 2; 1 2 10]): ');
b=input('Enter right side Matrix B (eg, [19;29;35]): ');
xold=input('Enter initial Guess matrix X_0 (eg, [0;0;0]): ');
tol=input('Enter tolerance (eg, 1e-5): ');
w=input('Enter parameter for SOR method, w (eg, 1.25): ');

[tab1,soln1]=jacobi(a,b,xold,tol);
[tab2,soln2]=gaussSeidel(a,b,xold,tol);
[tab3,soln3]=sor(a,b,xold,tol,w);

disp(tab1);
disp(tab2);
disp(tab3);

fprintf('Solution in Jacobi method\n');
disp(soln1);
fprintf('Solution in Gauss Seidel method\n');
disp(soln2);
fprintf('Solution in SOR method\n');
disp(soln3);

figure (1)
hold on
plot(tab1(:,1)', tab1(:,end)','r-*');
plot(tab2(:,1)', tab2(:,end)','b-*');
plot(tab3(:,1)', tab3(:,end)','g-*');
legend('Jacobi Iterative Method','Gauss Seidel Method','SOR Method');
xlabel('Iteration');
ylabel('Error');
hold off


%figure (2)
%surf(soln1)

end

function [tab,soln]=jacobi(A,B,xold,tol)
n=size(A,1);
x=xold;
err=Inf;
k=0;
while any (err>tol)
    k=k+1;
    iteration(k)=k;
    xold=x;
    for i=1:n
        sum=0;
        for j=1:n
            if j~=i
                sum=sum+A(i,j)*xold(j);
            end
        end
        x(i)=(1/A(i,i))*(B(i)-sum);
    end
    table(k,:)=x;
    err=abs(xold-x);
    error(k)=max(abs(xold-x));
end
tab=[iteration' table error']
soln=x';
end

function [tab,soln]=gaussSeidel(A,B,xold,tol)
n=size(A,1);
x=zeros(n,1);
k=1;
err=Inf;
while err>tol
    for i=1:n
        fs=0;
        ss=0;
        for j=1:i-1
            fs=fs+A(i,j)*x(j);
        end
        for j=i+1:n
            ss=ss+A(i,j)*xold(j);
        end
        x(i)=(1/A(i,i))*(-fs-ss+B(i));
    end
    iteration(k)=k;
    temp(k,:)=xold;
    err=abs(xold-x);
    error(k)=max(err);
    xold=x;
    k=k+1;
end
tab=[iteration' temp error']
soln=xold';
end

function [tab,soln]=sor(A,B,xold,tol,w)
n=size(A,1);
x=zeros(n,1);
k=1;
err=Inf;
while err>tol
    for i=1:n
        fs=0;
        ss=0;
        for j=1:i-1
            fs=fs+A(i,j)*x(j);
        end
        for j=i+1:n
            ss=ss+A(i,j)*xold(j);
        end
        x(i)=(1-w)*xold(i)+(1/A(i,i))*(w*(-fs-ss+B(i)));
    end
    iteration(k)=k;
    temp(k,:)=xold;
    err=abs(xold-x);
    error(k)=max(err);
    xold=x;
    k=k+1;
end
tab=[iteration' temp error']
soln=xold';
end