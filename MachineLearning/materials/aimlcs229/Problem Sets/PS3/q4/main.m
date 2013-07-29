clc
clear
format compact
%% constants
k = 3; % [3, 4]

%% load data
X = load('x.dat');

%% run test
[clusters, centroids] = k_means(X, k);
centroids
% draw_clusters(X, clusters, centroids)
