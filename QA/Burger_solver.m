function [U] = Burger_solver(N,del_t,T_horizon)
% N is the number of grid points in between 0 and 1 
h = 1/(N+1);
Xs = 0:h:1;
Ts = 0:del_t:T_horizon;
n_iters = size(Ts);
n_iters = n_iters(2);

U = zeros(N+2, n_iters);
%Initial conditions
for i=1:N+2
    U(i,1) = 1.5 + sin(2*pi*Xs(i));
end
% Update rule
for j=2:n_iters
    for i=2:N+2
        U(i,j) = U(i,j-1) - (del_t/h)*(U(i,j-1))*(U(i,j-1)-U(i-1,j-1));
    end
    % Periodic boundary conditions
    U(1,j) = U(N+2,j);
end
end
