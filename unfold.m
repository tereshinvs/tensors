function B = unfold(A, Ks, NKs)
    Asize = size(A);
    An = size(Asize, 2);
    
    if nargin < 3
        NKs = setdiff(1:An, Ks);
    end
    
    Ksn = size(Ks, 2);
    NKsn = size(NKs, 2);

    leftIdxs = Asize(Ks);
    rightIdxs = Asize(NKs);

    sizeLeft = prod(Asize(Ks));
    sizeRight = prod(Asize(NKs));
    B = zeros(sizeLeft, sizeRight);
    
    for i = 1 : sizeLeft
        for j = 1 : sizeRight
            leftIdx = cell(1, Ksn);
            [leftIdx{:}] = ind2sub(leftIdxs, i);
            rightIdx = cell(1, NKsn);
            [rightIdx{:}] = ind2sub(rightIdxs, j);

            Aidx = cell(1, An);
            Aidx(Ks) = leftIdx(:);
            Aidx(NKs) = rightIdx(:);

            B(i, j) = A(sub2ind(Asize, Aidx{:}));
        end
    end
end
