clc; clear; close all;

x = [0 1 2 3];   
y = [2 -1 0 -1]; 
xp = 0.5;              
n = length(x);
h = x(2) - x(1);        

D = zeros(n, n);
D(:, 1) = y;             

for j = 2:n
    for i = n:-1:j 
        D(i, j) = D(i, j-1) - D(i-1, j-1);
    end
end

syms p;
u = (p - x(n)) / h; 
sum = y(n);         
m = u;           

for k = 1:(n - 1)
    sum = sum + m * D(n, k+1); 
    m = m * ((u + k) / (k + 1)); 
end

poly = simplify(sum);

disp('Interpolating Polynomial P(p):');
disp(poly);

value_at_xp = double(subs(poly, p, xp)); 
disp(['Value at xp = ', num2str(xp), ':']);
disp(value_at_xp);

data = [x(:), D]; 
T = array2table(data, 'VariableNames', {'x', 'y', 'dy', 'd2y', 'd3y'});
disp(T);

figure('Name', 'Backward Difference Table');
uitable('Data', data, 'ColumnName', {'x', 'y', 'dy', 'd2y', 'd3y'});

figure(2);
fplot(poly, [min(x) max(x)], 'r-', 'LineWidth', 2); 
hold on;
plot(x, y, 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 6);
plot(xp, value_at_xp, 'bs', 'MarkerFaceColor', 'b', 'MarkerSize', 8); 
xlabel('x');
ylabel('y');
title('Newton Backward Interpolation');
legend('Polynomial Curve', 'Data Points', 'Interpolated Point');
grid on;