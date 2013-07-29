clc
clear
format compact
%% constants


%% load data
[X_ica, X_pca] = load_images;
% X_pca = X_pca(:,1:4640);
% X_pca = X_pca(:,4640:4640*2);
% X_pca = X_pca(:,4640*2:4640*3);
% X_pca = X_pca(:,4640*3:4640*4);

%% run PCA test
U = pca(X_pca);

%% run ICA test
W = ica(X_ica);

%% plot U from PCA and W from ICA
figure(1);
plot_pca_filters(U)
figure(2);
plot_ica_filters(W)

%% print output
disp('main:')
