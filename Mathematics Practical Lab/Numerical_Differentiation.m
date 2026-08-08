%Numerical_Differentioan
f=input('Enter the function e.g. @(x) sin(x): ');
h=input('Enter the step size:  ');
d=input('Derivative we want to compute: ');
x=input('Enter the point that we will compute: ');

if d==1
    Fd2=(f(x+h)-f(x))/h;
    Bd2=(f(x)-f(x-h))/h;
    Cd2=(f(x+h)-f(x-h))/(2*h);
    disp('Results using 2-points formulas')
    fprintf('Forward: %.4f\n', Fd2)
    fprintf('Backward: %.4f\n', Bd2)
    fprintf('Centered: %.4f\n', Cd2)
    
elseif d==2
    Fd3=(f(x+2*h)-2*f(x+h)+f(x))/(h^2);
    Bd3=(f(x-2*h)-2*f(x-h)+f(x))/(h^2);
    Cd3=(f(x+h)-2*f(x)+f(x-h))/(h^2);
    disp('Results using 3-points formulas')
    fprintf('Forward: %.4f\n', Fd3)
    fprintf('Backward: %.4f\n', Bd3)
    fprintf('Centered: %.4f\n', Cd3)
else disp('Formulas not available')
end