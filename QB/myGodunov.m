clc;
clear;
% Number of points in between 0 and 1 
N = 100;
h = 1/(N+1);
del_t = 0.1*h;
Xs = 0:h:1;
% Time horizon
T_horizon = 1;
Ts = 0:del_t:T_horizon;
n_iters = size(Ts);
n_iters = n_iters(2);

U = zeros(N+2, n_iters);

% Initial conditions
inital_val = @(a,b,h) (1/h)*(1.5*(b-a) + ((cos(2*pi*a)-cos(2*pi*b))/(2*pi)));
for i=1:N+2
    if i==1
        U(i,1) = 1.5 + sin(2*pi*Xs(i));
    elseif i==N+2
        U(i,1) = 1.5 + sin(2*pi*Xs(i));
    else
        left = (Xs(i-1)+Xs(i))/2;
        right = (Xs(i)+Xs(i+1))/2;
        U(i,1) = inital_val(left, right, h);
    end
    
end

% Update rule
for j=2:n_iters
    U(1,j) = U(1,j-1) - (del_t/h)*(f(Godunov_flux2(U(1,j-1),U(2,j-1))) - f(Godunov_flux2(U(end,j-1),U(1,j-1))));
    for i=2:N+1
        U(i,j) = U(i,j-1) - (del_t/h)*(f(Godunov_flux2(U(i,j-1), U(i+1,j-1))) - f(Godunov_flux2(U(i-1,j-1), U(i,j-1))));
    end
    U(end,j) = U(end,j-1) - (del_t/h)*(f(Godunov_flux2(U(end,j-1),U(1,j-1))) - f(Godunov_flux2(U(end-1,j-1),U(end,j-1))));
end

% Visualization
for i=1:n_iters
    plot(Xs,U(:,i))
    ylim([-2,3])
    pause(0.05)
end
