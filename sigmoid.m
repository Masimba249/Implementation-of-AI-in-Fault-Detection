% sigmoid: calculate sigmoid function
%
% y = sigmoid(x)
%

function y = sigmoid(x)

y = 1.0 ./ ( 1.0 + exp(-x) );
