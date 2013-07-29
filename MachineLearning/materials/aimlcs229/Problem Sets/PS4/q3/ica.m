function W = ica(X)

%%% YOUR CODE HERE
%% constants
alpha = 0.0005;
epsilon = 1e-5;
ITER_MAX = 10;
b = 100; % number of examples in one batch

%% data set size = m
m = size(X, 2);

%% feature dim = n
n = size(X ,1);

%% optimize W: max l(W) 
% using hybrid stochastic/batch gradient descent algorithm
W_old = zeros(n);
W = randn(n);

for iter=1:ITER_MAX
    %% terminate condition
    if norm(W_old - W) < epsilon
        break
    else
        W_old = W;
    end
    
    %% randomize the order of the examples
    X = X(:, randperm(m));
    
    %% hybrid stochastic/batch gradient descent algorithm
    for i=1:floor(m/b)
        Xb = X(:,((i-1)*b+1):(i*b));

        assert(size(W, 2) == size(X, 1))
        W = W + alpha *( (1 - 2*sigmoid(W*Xb)) * Xb' + b*(W^-1)' );
    end
    iter
end

%% assert( iter < ITER_MAX)
if( iter >= ITER_MAX)
    disp(['assert failed, iter = ' num2str(iter)])
else
    iter
end

return;