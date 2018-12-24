function I = fcnK6(S, t, u, alpha, F, tol, idx_A, idx_B, idx_C, idx_D) 
len = size(S,1);
I = nan(len,2);
 
I(idx_A) = fcnK6A(S(idx_A), t(idx_A), u(idx_A), alpha(idx_A), reshape(F(idx_A(:,:,[1,1])),[],1,2), tol);
I(idx_B) = fcnK6B(S(idx_B), t(idx_B), u(idx_B), alpha(idx_B), reshape(F(idx_B(:,:,[1,1])),[],1,2), tol);
I(idx_C) = fcnK6C(S(idx_C), t(idx_C), u(idx_C), alpha(idx_C), reshape(F(idx_C(:,:,[1,1])),[],1,2), tol);
I(idx_D) = fcnK6D(S(idx_D), t(idx_D), u(idx_D), alpha(idx_D), reshape(F(idx_D(:,:,[1,1])),[],1,2), tol); 

end
