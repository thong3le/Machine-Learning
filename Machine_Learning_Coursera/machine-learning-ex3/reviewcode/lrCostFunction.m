function [J, grad] = lrCostFunction(theta, X, y, lambda)
%LRCOSTFUNCTION compute cost and gradient for logistic regression with
%regularization
%   J = LRCOSTFUNCTION(theta, X, y, labda) computes the cost of using theta
%   as the parameter for regularized logistic regression and the gradient
%   of the cost w.r.t the paramenters.

m = length(y);

J = 0;
grad = zeros(size(theta));

temp = theta;
temp(1) = 0;

J = 1/m * sum( -y .* log(sigmoid(X * theta)) - (1-y) .* log(1 - sigmoid(X * theta))) + lambda/(2*m) * sum(temp.^2);

grad = 1/m * X' * (sigmoid(X * theta) - y) + lambda/m * temp;

grad = grad(:);

end