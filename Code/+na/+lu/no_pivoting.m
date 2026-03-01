function [L, U] = no_pivoting(A)
%NO_PIVOTING LU factorization without pivoting.
%   [L, U] = NO_PIVOTING(A) returns unit-lower-triangular L and
%   upper-triangular U such that A = L*U, when all pivots are nonzero.

[n, m] = size(A);
if n ~= m
    error("na:lu:NonSquare", "Input matrix A must be square.");
end

U = A;
L = eye(n, class(A));

for k = 1:n-1
    pivot = U(k, k);
    if pivot == 0
        error("na:lu:ZeroPivot", "Zero pivot encountered at step %d.", k);
    end

    L(k+1:n, k) = U(k+1:n, k) / pivot;
    U(k+1:n, k:n) = U(k+1:n, k:n) - L(k+1:n, k) * U(k, k:n);
end
end
