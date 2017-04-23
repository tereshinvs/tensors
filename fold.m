function A = fold(B, Ks, NKs, Asize)
    A = zeros(Asize);
    An = size(Asize, 2);

    Ksn = size(Ks, 2);
    NKsn = size(NKs, 2);

    leftIdxs = Asize(Ks);
    rightIdxs = Asize(NKs);

    for i = 1 : size(B, 1)
        for j = 1 : size(B, 2)
            leftIdx = cell(1, Ksn);
            [leftIdx{:}] = ind2sub(leftIdxs, i);
            rightIdx = cell(1, NKsn);
            [rightIdx{:}] = ind2sub(rightIdxs, j);

            Aidx = cell(1, An);
            Aidx(Ks) = leftIdx(:);
            Aidx(NKs) = rightIdx(:);

            A(sub2ind(Asize, Aidx{:})) = B(i, j);
        end
    end
end
