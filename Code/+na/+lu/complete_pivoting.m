function [P, Q, L, U] = complete_pivoting(A)
%GAUSSIANELIMINATIONCOMPLETEPIVOTING
% 全主元（Complete Pivoting）Gauss 消去，输出 PAQ = LU
%
% 输入：
%   A : n×n 矩阵
% 输出：
%   P,Q : 置换矩阵（P 记录行交换，Q 记录列交换）
%   L   : 单位下三角矩阵（对角线为 1）
%   U   : 上三角矩阵
%
% 说明：
%   消去过程中把乘子存到 A 的严格下三角部分，最后再组装 L、U。

    % --- 检查输入 ---
    [n, m] = size(A);
    if n ~= m
        error('A must be a square matrix.');
    end

    % --- 初始化 ---
    P = eye(n);
    Q = eye(n);

    % --- 主循环 ---
    for k = 1 : n-1
        % 1) 在子块 A(k:n, k:n) 中选取绝对值最大的元素作为主元
        subA = abs(A(k:n, k:n));
        [~, idx] = max(subA(:));
        [p_rel, q_rel] = ind2sub(size(subA), idx);
        p = p_rel + k - 1;
        q = q_rel + k - 1;

        % 2) 交换第 k 行与第 p 行
        if p ~= k
            A([k, p], :) = A([p, k], :);
            P([k, p], :) = P([p, k], :);   % 记录行置换
        end

        % 3) 交换第 k 列与第 q 列
        if q ~= k
            A(:, [k, q]) = A(:, [q, k]);
            Q(:, [k, q]) = Q(:, [q, k]);   % 记录列置换
        end

        % 4) 若主元为 0，则矩阵在当前步骤下奇异/数值退化，终止
        if A(k, k) == 0
            break;
        end

        % 5) 进行 Gauss 消去：计算乘子并更新右下角子块
        A(k+1:n, k) = A(k+1:n, k) / A(k, k);  % 乘子（存到第 k 列下方）
        A(k+1:n, k+1:n) = A(k+1:n, k+1:n) - A(k+1:n, k) * A(k, k+1:n);
    end

    % --- 从 A 中组装 L, U ---
    L = eye(n) + tril(A, -1);  % 单位下三角：对角线 1，严格下三角取乘子
    U = triu(A);               % 上三角：取 A 的上三角部分（含对角线）
end