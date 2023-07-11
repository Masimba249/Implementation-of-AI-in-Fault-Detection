% randRBM: get randomized restricted boltzmann machine (RBM) model
%
% rbm = randRBM( dimV, dimH, type )
%

function rbm = randRBM( dimV, dimH, type )

if( ~exist('type', 'var') || isempty(type) )
	type = 'BBRBM';
end

if( strcmpi( 'GB', type(1:2) ) )
    rbm.type = 'GBRBM';
    rbm.W = randn(dimV, dimH) * 0.1;
    rbm.b = zeros(1, dimH);
    rbm.c = zeros(1, dimV);
    rbm.sig = ones(1, dimV);
else
    rbm.type = type;
    rbm.W = randn(dimV, dimH) * 0.1;
    rbm.b = zeros(1, dimH);
    rbm.c = zeros(1, dimV);
end

