

浮点数的储存

前向误差和后向误差

---
线性代数基础

# 正交向量

## 四个子空间的正交性

1. Orthogonal vectors have $v^T w = 0$. Then $|v|^2 + |w|^2 = |v + w|^2 = |v - w|^2$.

2. Subspaces $V$ and $W$ are orthogonal when $v^T w = 0$ for every $v$ in $V$ and every $w$ in $W$.

3. The row space of $A$ is orthogonal to the nullspace. The column space is orthogonal to $N(A^T)$.

4. One pair of dimensions adds to $r + (n - r) = n$. The other pair has $r + (m - r) = m$.

5. Row space and nullspace are orthogonal *complements*: Every $x$ in $\mathbb{R}^n$ splits into $x_{\text{row}} + x_{\text{null}}$.

6. Suppose a space $S$ has dimension $d$. Then every basis for $S$ consists of $d$ vectors.

7. If $d$ vectors in $S$ are independent, they span $S$. If $d$ vectors span $S$, they are independent.

正交补：一个子空间V的**正交补** $V^{\perp}$定义为：所有垂直于这个子空间的向量的集合。
矩阵A的零空间$Null(A)$是行空间$C(A^T)$的正交补。
相应的，矩阵A的左零空间$Null(A^T)$是列空间$C(A)$的正交补。


## 投影

1. The projection of a vector $b$ onto the line through $a$ is the closest point $p = a\left(a^T b / a^T a\right)$.

2. The error $e = b - p$ is perpendicular to $a$ : Right triangle $bpe$ has $|p|^2 + |e|^2 = |b|^2$.

3. The projection of $b$ onto a subspace $S$ is the closest vector $p$ in $S$; $b - p$ is orthogonal to $S$.

4. $A^T A$ is invertible (and symmetric) only if $A$ has independent columns : $N(A^T A) = N(A)$.

5. Then the projection of $b$ onto the column space of $A$ is the vector $p = A(A^T A)^{-1}A^T b$.

6. The projection matrix onto $C(A)$ is
   $$
   P = A(A^T A)^{-1}A^T.
   $$
   It has $p = Pb$ and $P^2 = P = P^T$.



奇异值分解


