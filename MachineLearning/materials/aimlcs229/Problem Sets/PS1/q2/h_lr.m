function y = h_lr(X, theta)

assert(size(X, 2) == size(theta, 1))
y = sigmoid(X*theta);
return;