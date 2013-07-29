function theta = l1ls(X,y,lambda)

%%% YOUR CODE HERE
%% constants
epsilon = 1e-5;
ITER_MAX = 2000;

%% training set size = m
m = size(X, 1); assert(m == size(y, 1))

%% feature dim = n
n = size(X ,2);

%% optimize theta: min J(theta) using coordinate descent algorithm
theta_old = nan(n, 1);
theta = randn(n, 1);

for iter=1:ITER_MAX
    %% terminate condition
    if norm(theta_old - theta) < epsilon
        break
    else
        theta_old = theta;
    end

	%% coordinate descent algorithm
    for j=1:n
        theta_bar = theta; theta_bar(j) = 0;
        %% if sign(theta(j)) == 1
        theta_j(1) = max(((y - X*theta_bar)'*X(:,j) - lambda)/(X(:,j)'*X(:,j)), 0);
        theta(j) = theta_j(1);
        obj(1) = 0.5*norm(X*theta - y)^2 + lambda*norm(theta, 1);
        %% if sign(theta(j)) == -1
        theta_j(2) = min(((y - X*theta_bar)'*X(:,j) + lambda)/(X(:,j)'*X(:,j)), 0);
        theta(j) = theta_j(2);
        obj(2) = 0.5*norm(X*theta - y)^2 + lambda*norm(theta, 1);
        
        %% choose the min. object value
        [obj_min, index_min] = min(obj);
        theta(j) = theta_j(index_min);
    end
end

%% assert( iter < ITER_MAX)
if( iter >= ITER_MAX)
    disp(['assert failed, iter = ' num2str(iter)])
else
    iter
end

return;   