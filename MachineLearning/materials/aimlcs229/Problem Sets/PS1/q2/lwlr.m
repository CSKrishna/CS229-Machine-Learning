function y = lwlr(X_train, y_train, x, tau)

%%% YOUR CODE HERE
%% constants
epsilon = 1e-5;
ITER_MAX = 20;
lambda = 0.0001;

%% training set size = m
m = size(X_train, 1); assert(m == size(y_train, 1))

%% feature dim = n
n = size(X_train ,2);

%% compute weights w for each training example
% w = nan(m, 1);
% for i=1:m
%     assert(size(x, 1) == size(X_train(i,:)', 1))
%     w(i) = exp(-norm(x-X_train(i,:)')^2 / (2*tau^2));
% end
w = exp(-sum( (X_train - repmat(x', m, 1)).^2, 2) / (2.*tau.^2));

%% optimize theta: max l(theta) using Newton's method
theta_old = nan(n, 1);
theta = zeros(n, 1);

for iter=1:ITER_MAX
    %% terminate condition
    if norm(theta_old - theta) < epsilon
        break
    else
        theta_old = theta;
    end
    
    %% compute Hessian matrix
    h = h_lr(X_train, theta);
    D = diag(-w.*h.*(1.-h));
    H = X_train'*D*X_train - lambda*eye(n);
    
    %% compute grad_theta(l(theta))
    z = w.*(y_train - h);
    grad_l = X_train'*z  - lambda*theta;
    
    %% update theta
    theta = theta - H \ grad_l;
end

%% assert( iter < ITER_MAX)
if( iter >= ITER_MAX)
    disp(['assert failed, iter = ' num2str(iter)])
else
    iter
end

%% output y = 1(h_theta(x) > 0.5) as the prediction
y = h_lr(x', theta) > 0.5;
return;
