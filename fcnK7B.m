function I = fcnK7B(S, t, u, alpha, F, tol)
t1 = F .^ 2;t2 = 0.1e1 ./ S;t7 = sqrt(t .* F + t1 .* S + u);t8 = 0.1e1 ./ t7;t10 = S .^ 2;t11 = 0.1e1 ./ t10;t16 = t .^ 2;t18 = 0.1e1 ./ t10 ./ S;t27 = 0.1e1 ./ (0.4e1 .* S .* u - t16);t28 = t8 .* t27;t29 = F .* t28;t32 = t16 .^ 2;t36 = sqrt(S);t46 = log(0.1e1 ./ t36 .* (t ./ 0.2e1 + S .* F) + t7);t49 = t11 .* u;t60 = t8 .* t2 .* t1 + 0.3e1 ./ 0.2e1 .* t8 .* F .* t11 .* t - 0.3e1 ./ 0.4e1 .* t8 .* t18 .* t16 - 0.3e1 ./ 0.2e1 .* t29 .* t11 .* t16 .* t - 0.3e1 ./ 0.4e1 .* t28 .* t18 .* t32 - 0.3e1 ./ 0.2e1 .* t46 ./ t36 ./ t10 .* t + 0.2e1 .* t8 .* t49 + 0.4e1 .* t29 .* t .* t2 .* u + 0.2e1 .* t8 .* t27 .* t16 .* t49;
I = t60(:,:,2) - t60(:,:,1);

end
