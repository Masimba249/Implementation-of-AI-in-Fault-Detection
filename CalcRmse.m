% CalcRmse: calculate the rmse between predictions and OUTs
%


function [rmse AveErrNum] = CalcRmse( dbn, IN, OUT )
 out = v2h( dbn, IN );

 err = power( OUT - out, 2 );
 rmse = sqrt( sum(err(:)) / numel(err) );

 bout = out > 0.5;
 BOUT = OUT > 0.5;

 err = abs( BOUT - bout );
 AveErrNum = mean( sum(err,2) );
end
