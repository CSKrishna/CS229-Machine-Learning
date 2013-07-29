clc
clear
format compact
%% constants
tau = .1; % [0.01, 0.05, 0.1, 0.5, 1.0, 5.0]
resolution = 100; % [50, 200]

%% load data
[X_train, y_train] = load_data;

%% run test
plot_lwlr(X_train, y_train, tau, resolution);