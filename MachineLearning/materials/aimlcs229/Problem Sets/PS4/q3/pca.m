function U = pca(X)

%%% YOUR CODE HERE
%% columns in U are eigenvectors of XX'
% [U, S, V] = svd(X*X');
[U, D] = eig(X*X');
% eig(X*X')

return;