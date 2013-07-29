clc
clear
format compact
%% constants
lambda = .01; %[0.001:10]

%% load data
[X,y,theta_true] = load_data();

%% run test
theta = l1ls(X,y,lambda);

%% print output
disp('main:')
disp('theta theta_true')
[theta theta_true]
disp('X*theta X*theta_true X*theta-y X*theta_true-y y')
[X*theta X*theta_true X*theta-y X*theta_true-y y]