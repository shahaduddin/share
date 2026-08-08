% Numerical_Integration
f=input('Enter the function: ');
n=input('Enter the no. of intervals: ');
a=input('Enter the lower limit: ');
b=input('Enter the upper limit: ');
h=(b-a)/n;
sum=0;
for i=1:n-1
    sum=sum+f(a+i*h);
end
TR=(h/2)*(f(a)+2*sum+f(b));
fprintf('Value of the integral using Trapezoidal rule: %.6f\n', TR)

oddsum=0;
for j=1:2:n-1
    oddsum=oddsum+f(a+j*h);
end

evensum=0;
for k=2:2:n-2
    evensum=evensum+f(a+k*h);
end
Sim_1_3=(h/3)*(f(a)+4*oddsum+2*evensum+f(b));
fprintf('Value of the integral using Simpson 1/3rd rule: %.6f\n', Sim_1_3)

