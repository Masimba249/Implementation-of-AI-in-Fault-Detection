% linearMaping: calculate the linear mapping matrix between the input data and the output data
%
% M = linearMapping( IN, OUT )
%
%
%Output parameters:
% M: The linear mapping matrix
%
%

function M = linearMapping( IN, OUT )
M = pinv(IN) * OUT;

%OUT = IN * M;
