% Lagrange Interpolation Code

x = [0 1 2 3];
    y = [2 -1 0 -1];
    r = .5; 

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

    xp = subs(poly, p, r);
    disp(double(xp));

    x_plot = linspace(min(x), max(x), 100);
    y_plot = double(subs(poly, p, x_plot));

    plot(x_plot, y_plot, 'r-', 'LineWidth', 2);
    hold on
    plot(x, y, 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 5);
    grid on;