function I = fcnK7B(S, T, u, alpha, F, tol)
t1 = F .^ 2;t3 = F .* T;t5 = sqrt(t1 .* S + t3 + u);t7 = (T .^ 2);t13 = u .^ 2;t16 = sqrt(S);t19 = S .^ 2;t20 = t16 .* t19;t28 = S .* u;t32 = log(0.2e1);t40 = log(0.1e1 ./ t16 .* (0.2e1 .* S .* F + 0.2e1 .* t16 .* t5 + T));t55 = -0.12e2 ./ (0.8e1 .* t28 - (2 .* t7)) ./ t20 .* (t16 .* S .* (t7 .* t1 ./ 0.6e1 - 0.5e1 ./ 0.3e1 .* u .* T .* F - 0.4e1 ./ 0.3e1 .* t13) - 0.2e1 ./ 0.3e1 .* u .* t20 .* t1 + ((t3 + u) .* t16 .* T ./ 0.2e1 + (-t32 + t40) .* (t28 - t7 ./ 0.4e1) .* t5) .* T) ./ t5;
I = t55(:,:,2) - t55(:,:,1);

end
