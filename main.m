!A = zeros([2 2 2]);
!A(:, :, 1) = [1 2; 3 4];
!A(:, :, 2) = [5 6; 7 8];
!A
!tucker(A)

!A = zeros(2, 2, 2);
!A(:, :, 1) = [1 2; 3 4];
!A(:, :, 2) = [5 6; 7 8];

!AUs = cell(1, 3);
!AUs{1} = eye(2);
!AUs{2} = eye(2);
!AUs{3} = eye(2);

!A
!combineTucker(A, AUs)

!A
!unfold(A, [1 2])

!A
![G, Us] = tucker(A)
!combineTucker(G, Us)

!A = zeros(2, 3, 4);
!for i = 1 : numel(A)
!    A(i) = i;
!end
!A
![G, Us] = tucker(A)
!combineTucker(G, Us)

!A - combineTucker(G, Us)

A = zeros(5, 6, 7);
for i = 1 : numel(A)
    idx = cell(1, size(size(A), 2));
    [idx{:}] = ind2sub(size(A), i);
    A(i) = cos(sum(cell2mat(idx)));
end
A
[G, Us] = tucker(A)
combineTucker(G, Us)
tmp = A - combineTucker(G, Us);
diff = sum(tmp(:).^2)

A = zeros(2, 3, 4);
for i = 1 : numel(A)
    idx = cell(1, size(size(A), 2));
    [idx{:}] = ind2sub(size(A), i);
    A(i) = i;
end
A
[G, Us] = tuckerApproximation(A, [0.1 0.1 0.1])
combineTucker(G, Us)
tmp = A - combineTucker(G, Us);
diff = sum(tmp(:).^2)

!Arand = rand(2, 3, 4)
[G, Us] = tuckerApproximation(Arand, [0.1 0.1 0.1])
combineTucker(G, Us)
tmp = Arand - combineTucker(G, Us);
diff = sum(tmp(:).^2)
