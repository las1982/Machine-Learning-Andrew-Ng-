data = csvread('ex1data1.txt'); % read comma separated data
x = data(:, 1);
y = data(:, 2);
m = length(y); % number of training examples   

figure; % open a new figure window
plot(x, y, 'rx', 'MarkerSize', 10); % Plot the data
ylabel('Profit in $10,000s'); % Set the y-axis label
xlabel('Population of City in 10,000s'); % Set the x-axis label


X = [ones(m, 1), data(:,1)]; % Add a column of ones to x
theta = zeros(2, 1); % initialize fitting parameters
iterations = 1500;
alpha = 0.01;


% computeCost()
J = 0
%---------------Вставлять это-------------
J = 1 / (2*m) * sum((X * theta - y).^2)
%-----------------------------------------

% gradientDescent()
J_history = zeros(iterations, 1);

for iter = 1:iterations
%---------------Вставлять это-------------
    theta = theta - alpha / m * sum((X * theta - y) .* x)
%-----------------------------------------
    J_history(iter) = 1 / (2*m) * sum((X * theta - y).^2);
end

hold on; % keep previous plot visible
plot(X(:,2), X*theta, '-')
legend('Training data', 'Linear regression')
hold off % don't overlay any more plots on this figure