        function Newton_Method
format long
f = @(x) x + x^(4/3); % Equation definition 
fp = @(x) 1 + 4/3*x^(1/3); % First-order derivative of f 
x0 = 1; % Initial guess 
N = 100; % Maximum number of iterations 
tol = 1E-6; % Convergence tolerance
x = zeros(N + 1,1); % Preallocate solution vector where row => iteration 
x(1) = x0; % Set initial guess % Newton's Method algorithm 
n = 2; 
nfinal = N + 1; % Store final iteration if tol is reached before N iterations 
while (n <= N + 1)
    fe = f(x(n - 1));
    fpe = fp(x(n - 1)); 
    x(n) = x(n - 1) - fe/fpe; 
    if (abs(fe) <= tol) 
        nfinal = n; % Store final iteration 
        break; 
    end
    n = n + 1;       
end 
%A = num2str(x, '%10.5e\n') 
%Root = ['The required root of the equation is: ', 'num2str', 'x']
% Plot evolution of the solution 
figure('Color','White') 
plot(0:nfinal - 1,x(1:nfinal),'o-') 
title('Newton''s Method Solution: $f(x) = x + x^{\frac{4}{3}}$','FontSize', 20,'Interpreter','latex') 
xlabel('Iteration','FontSize',16) 
ylabel('$x$','FontSize',16,'Interpreter','latex')


end

