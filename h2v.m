

function V = h2v(dnn, H)

ind1 = numel(dnn.type);
ind0 = ind1-2;
type = dnn.type(ind0:ind1);

if( isequal(dnn.type, 'BBRBM') )
  V = sigmoid( bsxfun(@plus, H * dnn.W', dnn.c ) );

elseif( isequal(dnn.type, 'GBRBM') )
    h = bsxfun(@times, H * dnn.W', dnn.sig);
    V = bsxfun(@plus, h, dnn.c );
    
elseif( isequal(dnn.type, 'BBPRBM') )
    w2 = dnn.W .* dnn.W;
    pp = H .* ( 1-H );
    mu = bsxfun(@plus, H * dnn.W', dnn.c );
    s2 = pp * w2';
    V = sigmoid( mu ./ sqrt( 1 + s2 * pi / 8 ) );
    
elseif( isequal(type, 'DBN') )
    nrbm = numel( dnn.rbm );
    V0 = H;
    for i=nrbm:-1:1
        V1 = h2v( dnn.rbm{i}, V0 );
        V0 = V1;
    end
    V = V1;
    
end
