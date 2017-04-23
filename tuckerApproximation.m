function [G, Us] = tuckerApproximation(A, Epss)
    Asize = size(A);
    d = size(Asize, 2);

    v = A;
    
    Sizes = Asize;
    
    Us = cell(1, d);
    
    for k = 1 : d
        vUnfold = unfold(v, 1);
        [U, S, V] = svd(vUnfold);
        Us{k} = U(:, logical(abs(diag(S)) > 1e-4));
        vnext = (S * V')';
        vnext = vnext(:, logical(abs(diag(S)) > 1e-4));
        r = rank(vUnfold);

        Sizes = [Sizes(2 : end) r];
        vnext = fold(vnext, 1 : (d-1), d, Sizes);

        idx = cell(1, d);
        for i = 1 : d - 1
            idx{i} = 1 : Sizes(i);
        end
        for s = 1 : (r - 1)
            idx{end} = s+1 : r;
            tmp = vnext(idx{:});
            if sum(vnext(:).^2) <= Epss(k)
                idx{end} = 1 : s;
                vnext = vnext(idx{:});
                Sizes(d) = s;
                disp('break')
                break;
            end
        end
        
        v = vnext;
    end
    
    G = v;
end
