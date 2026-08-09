clc;clear;close all;

x = [0 1 2 3];
y = [2 -1 0 -1];
xp = 0.5; 
n = length(x);
syms p; 
sum = 0;

for i = 1:n
    L = 1;
    for j = 1:n
        if j ~= i
            L = L * (p - x(j)) / (x(i) - x(j));
        end
    end
    sum = sum + y(i) * L;
end

poly = simplify(sum);
disp(poly);

value_at_xp = subs(poly, p, xp);
disp(double(value_at_xp));
fplot(poly, [min(x) max(x)], 'r-', 'LineWidth', 2); 
hold on;
plot(x, y, 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 6);
plot(xp,value_at_xp, 'bs', 'MarkerFaceColor', 'b', 'MarkerSize', 6);
xlabel('x');
ylabel('y');
title('Lagrange Interpolation');
grid on;
