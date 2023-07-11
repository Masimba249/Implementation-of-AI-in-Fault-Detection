% GetOnInd: get indexes which are used (not dropped) nodes
%
% OnInd = GetOnInd( dbn, DropOutRate, strbm )
%
%
%Output parameters:
% OnInd: indexes which are used (not dropped) nodes
%
%
%Input parameters:
% dbn: the Original Deep Belief Nets (DBN) model
% DropOutRate: 0 < DropOutRate < 1
% strbm (optional): started rbm layer to dropout (Default: 1)

function OnInd = GetOnInd( dbn, DropOutRate, strbm )

if( ~exist('strbm', 'var') || isempty(strbm) )
	strbm = 1;
end

OnInd = cell(numel(dbn.rbm),1);

for n=1:numel(dbn.rbm)
    dimV = size(dbn.rbm{n}.W,1);
    if( n >= strbm )
        OnNum = round(dimV*DropOutRate(n));
        OnInd{n} = sort(randperm(dimV, OnNum));
    else
        OnInd{n} = 1:dimV;
    end
end