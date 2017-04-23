function [G, Us] = tucker(A)
    d = size(size(A), 2);
    Us = cell(1, d);
    for i = 1 : d
        Ak = unfold(A, i);
        Rk = rank(Ak);
        [U, S, V] = svd(Ak);
        Us{i} = pinv(U(:, logical(abs(diag(S)) > 1e-4)))';
    end
    G = combineTucker(A, cellfun(@transpose, Us, 'UniformOutput', false));
end
