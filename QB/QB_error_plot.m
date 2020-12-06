clc;
clear;
% Number of grid points on coarsest grid
% Note: number of grid points is exclusive of 0 and 1
N = 20;

% Most fine grid parameter
finest_grid = 10;

% Function to compute the number of grid points in-between the edges 
% k accounts for the coarseness of the grid, the higher the value, the
% finer the grid
% n is the the number of points int the most coarse grid
num_pts = @(n,k) (2^k*(n+1)-1);

% Number of grid points on finest grid
n_finest = num_pts(N,finest_grid);

% Use a value of del_t such that CFL conditions are satisfied for all cases
del_t = 0.1*(1/(n_finest+1)); 

% Time horizon
T_horizon = 0.1;

U_finest = Godunov_solver(n_finest, del_t, T_horizon);

all_errors = zeros(1,finest_grid+1);

for k=0:finest_grid
    n_pts = num_pts(N,k);
    curr_U = Godunov_solver(n_pts, del_t, T_horizon);
    to_skip_pow = finest_grid - k;
    fin_U_downsample = U_finest(1:2^to_skip_pow:n_finest+2, :);
    all_errors(1, k+1) = max(max(abs(fin_U_downsample - curr_U)));
end

delh = zeros(1,finest_grid+1);
for i=1:finest_grid+1
    delh(1,i) = 1/(num_pts(N, i-1)+1);
end

l_delh = log(delh);
l_err = log(all_errors);
% plot(l_delh, l_err)
% xlabel('log h')
% ylabel('log max-norm error')
plot(delh, all_errors)
xlabel('Grid spacing')
ylabel('Max norm Error')