function tests = test_no_pivoting
tests = functiontests(localfunctions);
end

function testFactorizationReconstruction(testCase)
A = [4, 3, 2; 6, 3, 0; 2, 1, 8];
[L, U] = na.lu.no_pivoting(A);

verifyEqual(testCase, L * U, A, "AbsTol", 1e-12);
verifyEqual(testCase, diag(L), ones(size(A, 1), 1), "AbsTol", 1e-15);
end

function testZeroPivotRaisesError(testCase)
A = [0, 1; 1, 1];
verifyError(testCase, @() na.lu.no_pivoting(A), "na:lu:ZeroPivot");
end
