function [P,Q,L,U] = complete_pivoting(A)
%COMPLETE_PIVOTING LU factorization with complete pivoting.
%   [P, Q, L, U] = COMPLETE_PIVOTING(A) returns permutation matrices
%   P, Q, a unit-lower-triangular matrix L, and an upper-triangular
%   matrix U such that:
%       P * A * Q = L * U
%
%   The routine uses complete pivoting: at step k, it selects the entry
%   with largest absolute value in U(k:n, k:n), then swaps both rows and
%   columns to place that entry at U(k, k).

[n,m] = size(A);
if n ~= m
    error("na:lu:NonSquare", "Input matrix A must be square.");
end

U = A;
L = eye(n, class(A));
P = eye(n, class(A));
Q = eye(n, class(A));

for k = 1:n-1
    % Find global pivot in trailing submatrix.
    trailing = abs(U(k:n, k:n));
    [pivot_abs, idx] = max(trailing(:));
    if pivot_abs == 0
        error("na:lu:SingularMatrix", ...
              "Matrix is singular at elimination step %d.", k);
    end

    [rel_row, rel_col] = ind2sub(size(trailing), idx);
    pivot_row = rel_row + k - 1;
    pivot_col = rel_col + k - 1;

    % Row swap: update U, P, and previously computed multipliers in L.
    if pivot_row ~= k
        U([k, pivot_row], :) = U([pivot_row, k], :);
        P([k, pivot_row], :) = P([pivot_row, k], :);
        if k > 1
            L([k, pivot_row], 1:k-1) = L([pivot_row, k], 1:k-1);
        end
    end

    % Column swap: update U and Q.
    if pivot_col ~= k
        U(:, [k, pivot_col]) = U(:, [pivot_col, k]);
        Q(:, [k, pivot_col]) = Q(:, [pivot_col, k]);
    end

    pivot = U(k, k);
    if pivot == 0
        error("na:lu:ZeroPivot", "Zero pivot encountered at step %d.", k);
    end

    L(k+1:n, k) = U(k+1:n, k) / pivot;
    U(k+1:n, k:n) = U(k+1:n, k:n) - L(k+1:n, k) * U(k, k:n);
end
end
