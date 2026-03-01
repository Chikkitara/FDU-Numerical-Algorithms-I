# Sep 29, 2024 (Due: 08:00 Oct 13, 2025)

**1.** It can be shown that Gaussian elimination without pivoting is numerically stable for solving strictly diagonally dominant linear systems, in the sense that the growth factor is bounded. Give a concrete upper bound on the growth factor.

**2.** We have mentioned in the lecture that for complex vectors $x$, $y \in \mathbb{C}^n$, $\|x\|_2 = \|y\|_2 > 0$ does *not* guarantee that there exists a Householder reflection $H$ such that $y = Hx$. Provide a sufficient and necessary condition for the existence of a Householder reflection $H$ so that $y = Hx$. Prove your claim.

**3.** Let

$$A = \begin{bmatrix} \alpha_1 & \rho_2 & \rho_3 & \cdots & \cdots & \rho_n \\ \beta_2 & \alpha_2 & 0 & \cdots & \cdots & 0 \\ \beta_3 & 0 & \alpha_3 & \ddots & & \vdots \\ \vdots & \vdots & \ddots & \ddots & \ddots & \vdots \\ \vdots & \vdots & & \ddots & \alpha_{n-1} & 0 \\ \beta_n & 0 & \cdots & \cdots & 0 & \alpha_n \end{bmatrix} \in \mathbb{R}^{n \times n}.$$

Design an efficient algorithm to compute the QR factorization of $A$.

**4.** Let $Q \in \mathbb{R}^{n \times n}$ be an orthogonal matrix. Show that $Q$ can be factorized as the product of finitely many Householder reflections, and if, in addition, $\det(Q) = 1$, $Q$ can be factorized as the product of finitely many Givens rotations.

**5.** Solve the following linear systems, using Gaussian elimination with and without pivoting:

$$\begin{bmatrix} 8 & 1 & & & & & \\ 6 & 8 & 1 & & & & \\ & 6 & 8 & 1 & & & \\ & & \ddots & \ddots & \ddots & & \\ & & & 6 & 8 & 1 & \\ & & & & 6 & 8 & 1 \\ & & & & & 6 & 8 \end{bmatrix} \begin{bmatrix} x_1 \\ x_2 \\ x_3 \\ \vdots \\ x_{98} \\ x_{99} \\ x_{100} \end{bmatrix} = \begin{bmatrix} 9 \\ 15 \\ 15 \\ \vdots \\ 15 \\ 15 \\ 14 \end{bmatrix}$$

and

$$\begin{bmatrix} 6 & 1 & & & & & \\ 8 & 6 & 1 & & & & \\ & 8 & 6 & 1 & & & \\ & & \ddots & \ddots & \ddots & & \\ & & & 8 & 6 & 1 & \\ & & & & 8 & 6 & 1 \\ & & & & & 8 & 6 \end{bmatrix} \begin{bmatrix} x_1 \\ x_2 \\ x_3 \\ \vdots \\ x_{98} \\ x_{99} \\ x_{100} \end{bmatrix} = \begin{bmatrix} 7 \\ 15 \\ 15 \\ \vdots \\ 15 \\ 15 \\ 14 \end{bmatrix}.$$

Compare the computed solutions with the exact ones. How can you say about the accuracy?

# Solution

还是先进行LU分解，再解线性方程组？



**6.** (H) Implement the cyclic reduction algorithm for solving tridiagonal linear systems. Test your implementation with the examples in Exercise 5.
(optional) How to solve banded linear systems using cyclic reduction?

**7.** (optional) It can be shown that Gaussian elimination with partial pivoting is numerically stable for solving nonsingular tridiagonal linear systems, in the sense that the growth factor is bounded. Give a concrete upper bound on the growth factor.

**8.** (optional) Let $w_1$, $w_2$, ..., $w_k \in \mathbb{C}^n$ be unit vectors. Try to find a matrix $T \in \mathbb{C}^{k \times k}$ such that

$$(I - 2w_1 w_1^*)(I - 2w_2 w_2^*) \cdots (I - 2w_k w_k^*) = I - [w_1, w_2, \ldots, w_k] T [w_1, w_2, \ldots, w_k]^*.$$