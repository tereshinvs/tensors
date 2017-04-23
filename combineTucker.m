function A = combineTucker(G, Us)
    Usize = size(Us);
    Un = Usize(2);
    I = zeros(1, Un);
    for i = 1 : Un
        I(i) = size(Us{i}, 1);
    end
    
    Gsize = zeros(1, Un);
    for i = 1 : Un
        Gsize(i) = size(Us{i}, 2);
    end
    Gn = Un;
    
    A = zeros(I);
    for Aidx = 1 : numel(A)
        Ai = cell(1, Un);
        [Ai{:}] = ind2sub(size(A), Aidx);
        for Gidx = 1 : numel(G)
            alphas = cell(1, Gn);
            [alphas{:}] = ind2sub(Gsize, Gidx);
            
            tmp = G(Gidx);
            for i = 1 : Un
                tmp = tmp * Us{i}(Ai{i}, alphas{i});
            end
            
            A(Aidx) = A(Aidx) + tmp;
        end
    end
end
