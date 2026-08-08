clc; clear; close all;

x = [0 1 2 3];   
y = [2 -1 0 -1];
n = length(x);

D = zeros(n, n);
D(:, 1) = y;            

for j = 2:n
    for i = 1:(n - j + 1)
        D(i, j) = (D(i+1, j-1) - D(i, j-1)) / (x(i + j - 1) - x(i));
    end
end

syms p;

sum = D(1, 1);
u = 1;

for k = 1:(n - 1)
    u = u * (p - x(k));
    sum = sum + u * D(1, k+1);
end

poly= simplify(sum);

disp(poly);

r = 0.5;
xp= (subs(poly,p,r));
disp(double(xp));

data = [x(:), D]; 
T = array2table(data, 'VariableNames', {'x', 'y', 'd1y', 'd2y', 'd3y'});
disp(T);
figure('Name','Differenc Table');
uitable('Data',data,'ColumnName',{'x', 'y', 'd1y', 'd2y', 'd3y'});

figure(2);
fplot(poly, [min(x) max(x)], 'r-', 'LineWidth', 2); 
hold on;
plot(x, y, 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 6);
xlabel('x');
ylabel('y');
title('Newton Divided Difference Interpolation');
grid on;