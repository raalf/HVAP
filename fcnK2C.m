function I = fcnK2C(S, t, u, alpha, F, tol)
t1 = S .* alpha;t2 = -t1 + u;t3 = 0.1e1 ./ t2;t4 = sqrt(-alpha);t5 = F - t4;t6 = 0.1e1 ./ t5;t8 = t5 .^ 2;t10 = t4 .* S;t11 = t5 .* t10;t14 = sqrt(t8 .* S - t1 + 0.2e1 .* t11 + u);t15 = 0.1e1 ./ t14;t18 = t2 .^ 2;t19 = 0.1e1 ./ t18;t23 = S .^ 2;t24 = alpha .* t23;t25 = t19 .* t24;t26 = 0.1e1 ./ u;t31 = sqrt(t2);t33 = 0.1e1 ./ t31 ./ t18;t37 = log(0.2e1 .* t6 .* (t14 .* t31 - t1 + t11 + u));t41 = t3 .* S;t46 = 0.1e1 ./ (t2 .* S + t24) ./ 0.4e1;t50 = F + t4;t51 = 0.1e1 ./ t50;t53 = t50 .^ 2;t55 = t50 .* t10;t58 = sqrt(t53 .* S - t1 - 0.2e1 .* t55 + u);t59 = 0.1e1 ./ t58;t72 = log(0.2e1 .* t51 .* (t58 .* t31 - t1 - t55 + u));t81 = 0.1e1 ./ t4;t82 = t3 .* t81;t85 = t26 .* t3;t92 = 0.1e1 ./ t31 ./ t2 .* t81;t103 = -t15 .* t6 .* t3 ./ 0.4e1 - 0.3e1 ./ 0.4e1 .* t15 .* t19 .* t10 - 0.3e1 ./ 0.4e1 .* F .* t15 .* t26 .* t25 + 0.3e1 ./ 0.4e1 .* t37 .* t33 .* t10 - 0.2e1 .* t15 .* t46 .* (t5 .* S + t10) .* t41 - t59 .* t51 .* t3 ./ 0.4e1 + 0.3e1 ./ 0.4e1 .* t59 .* t19 .* t10 - 0.3e1 ./ 0.4e1 .* F .* t59 .* t26 .* t25 - 0.3e1 ./ 0.4e1 .* t72 .* t33 .* t10 - 0.2e1 .* t59 .* t46 .* (t50 .* S - t10) .* t41 + t15 .* t82 ./ 0.4e1 - F .* S .* t15 .* t85 ./ 0.4e1 - t37 .* t92 ./ 0.4e1 - t59 .* t82 ./ 0.4e1 - F .* S .* t59 .* t85 ./ 0.4e1 + t72 .* t92 ./ 0.4e1;
I = t103(:,:,2) - t103(:,:,1);

end
