function I = fcnK7A(S, T, u, alpha, F, tol)
t1 = S .* alpha;t2 = sqrt(-alpha);t3 = t2 .* T;t4 = -t1 + t3 + u;t5 = t4 .^ 2;t6 = sqrt(t4);t9 = F .^ 2;t10 = T .^ 2;t11 = t10 .* t9;t14 = u .^ 2;t15 = t14 .* u;t18 = S .^ 2;t20 = sqrt(S);t21 = t20 .* t18 .* S;t23 = t10 .^ 2;t24 = t23 .* t9;t28 = t20 .* t18;t30 = t18 .^ 2;t31 = t20 .* t30;t37 = alpha .^ 2;t38 = t37 .* alpha;t41 = -0.3e1 ./ 0.5e1 .* t2 .* t38 .* T .* (t21 .* (-0.6e1 .* u .* t11 - 0.20e2 ./ 0.3e1 .* t15) + t28 .* (t24 + 0.5e1 ./ 0.3e1 .* t14 .* t10) + 0.8e1 .* t14 .* t31 .* t9);t51 = t20 .* t30 .* S;t57 = t37 .^ 2;t60 = t2 .* t57 .* (-0.18e2 .* u .* t10 .* t21 + 0.3e1 .* t23 .* t28 + t31 .* (t11 + 0.24e2 .* t14) - 0.4e1 .* u .* t51 .* t9) .* T ./ 0.5e1;t69 = -t2 .* t57 .* alpha .* (t10 .* t31 - 0.4e1 .* u .* t51) .* T ./ 0.5e1;t78 = t2 .* t37 .* (t10 .* t28 - 0.4e1 .* t21 .* u) .* t14 .* T .* t9;t79 = t37 .* t23;t81 = alpha .* t10;t84 = t14 .^ 2;t85 = 0.8e1 .* t84;t97 = alpha .* t15;t107 = t20 .* t30 .* t18;t112 = t9 + alpha;t115 = 0.2e1 ./ 0.5e1 .* t37 .* t112 .* (t21 .* (-0.9e1 .* t14 .* t81 - 0.2e1 .* t79 - t85) + t28 .* (u .* alpha .* t23 + 0.2e1 .* t15 .* t10) + t31 .* (0.12e2 .* t37 .* u .* t10 + 0.20e2 .* t97) + t51 .* (-t38 .* t10 - 0.16e2 .* t14 .* t37) + 0.4e1 .* u .* t38 .* t107);t119 = F .* T;t121 = sqrt(t9 .* S + t119 + u);t122 = -t1 - t3 + u;t123 = sqrt(t122);t127 = 0.2e1 .* S .* F;t128 = -t127 - T;t130 = 0.2e1 .* u;t135 = log(0.1e1 ./ (F + t2) .* (0.2e1 .* t121 .* t123 + t2 .* t128 + t119 + t130));t148 = log(0.1e1 ./ (F - t2) .* (0.2e1 .* t121 .* t6 - t2 .* t128 + t119 + t130));t153 = S .* u - t10 ./ 0.4e1;t157 = (t1 - u) .^ 2;t159 = (t81 + t157) .^ 2;t166 = log(0.1e1 ./ t20 .* (0.2e1 .* t20 .* t121 + T + t127));t170 = log(0.2e1);t186 = t10 .* T;t191 = t9 .^ 2;t192 = t9 .* alpha;t228 = t14 .* F;t256 = F .* (t9 + 0.3e1 ./ 0.4e1 .* alpha);t260 = alpha .* u;t282 = 0.3e1 ./ 0.2e1 .* alpha + t9;t307 = t81 + t14;t318 = t307 .^ 2;t330 = t122 .^ 2;t343 = -0.1e1 ./ t112 ./ t153 ./ t28 ./ t121 ./ t123 ./ t330 .* (-0.15e2 ./ 0.8e1 .* t135 .* t121 .* t6 .* (-t41 + t60 - t69 + t78 + t115) + t123 .* (0.15e2 ./ 0.8e1 .* t148 .* (-t41 + t60 - t69 + t78 - t115) .* t121 + t6 .* (0.6e1 .* t166 .* t159 .* t121 .* t112 .* T .* t153 - 0.6e1 .* t121 .* t159 .* t112 .* T .* t170 .* t153 + 0.2e1 .* t21 .* alpha .* (t23 .* (t9 + 0.5e1 ./ 0.4e1 .* alpha) .* t37 .* t9 - 0.13e2 ./ 0.2e1 .* t186 .* t37 .* u .* (t9 + 0.10e2 ./ 0.13e2 .* alpha) .* F + 0.11e2 .* t10 .* (t191 + 0.29e2 ./ 0.44e2 .* t192 - t37 ./ 0.2e1) .* alpha .* t14 - 0.19e2 .* T .* t97 .* (t9 + 0.18e2 ./ 0.19e2 .* alpha) .* F + 0.8e1 .* (t191 - 0.3e1 ./ 0.4e1 .* t192 - 0.15e2 ./ 0.8e1 .* t37) .* t84) + t28 .* (t23 .* T .* (0.3e1 ./ 0.2e1 .* t57 .* F + 0.2e1 .* t38 .* t9 .* F) - 0.8e1 .* t79 .* u .* (t191 + 0.7e1 ./ 0.8e1 .* t192 - 0.3e1 ./ 0.16e2 .* t37) + 0.50e2 .* t186 .* t37 .* (t9 + 0.99e2 ./ 0.100e3 .* alpha) .* t228 - 0.12e2 .* t81 .* (t191 - 0.7e1 ./ 0.3e1 .* t192 - 0.27e2 ./ 0.8e1 .* t37) .* t15 + 0.36e2 .* T .* t112 .* alpha .* t84 .* F - 0.4e1 .* (t9 - 0.6e1 .* alpha) .* t112 .* t84 .* u) - 0.12e2 .* t31 .* t37 .* (-t186 .* t37 .* t256 ./ 0.6e1 + t10 .* (t191 + 0.7e1 ./ 0.6e1 .* t192 - t37 ./ 0.8e1) .* t260 - 0.5e1 ./ 0.3e1 .* T .* alpha .* (t9 + 0.4e1 ./ 0.5e1 .* alpha) .* t228 + 0.2e1 .* (t191 + 0.5e1 ./ 0.12e2 .* t192 - 0.5e1 ./ 0.6e1 .* t37) .* t15) + t51 .* t38 .* (t10 .* t282 .* t192 - 0.8e1 .* T .* t260 .* t256 + 0.16e2 .* t14 .* (t191 + t192 - 0.3e1 ./ 0.8e1 .* t37)) + t20 .* S .* t112 .* t307 .* (alpha .* t24 - 0.22e2 .* t186 .* F .* t260 + t10 .* (t9 - 0.20e2 .* alpha) .* t14 - 0.10e2 .* T .* t15 .* F - t85) - 0.4e1 .* t107 .* t57 .* t282 .* u .* t9 + 0.3e1 .* (t119 + u) .* t112 .* t318 .* t20 .* t10))) ./ t6 ./ t5 ./ 0.4e1;
I = t343(:,:,2) - t343(:,:,1);

end
