function J_1 = fcnJ_1(x_m, y_m, z_m, xi_1, xi_3, C, D_LE, E, D_TE)
t3 = (C .* x_m + D_LE - y_m);
t5 = abs(z_m);
t6 = t5 .* C;
t8 = x_m + z_m;
t11 = x_m - z_m;
t14 = (C .* t11 + D_LE - y_m) .* (C .* t8 + D_LE - y_m);
t16 = sqrt(-2.*i .* t6 .* t3 + t14);
t17 = -i .* t16;
t18 = C .^ 2;
t19 = (xi_1 .^ 2);
t21 = y_m - D_LE;
t25 = x_m .^ 2;
t27 = 2 .* x_m .* xi_1;
t28 = y_m .^ 2;
t30 = 2 .* D_LE .* y_m;
t31 = z_m .^ 2;
t32 = D_LE .^ 2;
t34 = sqrt((-2 .* C .* t21 .* xi_1 + t19 .* t18 + t19 + t25 - t27 + t28 - t30 + t31 + t32));
t36 = t18 .* xi_1;
t37 = C .* t21;
t40 = -i .* x_m;
t41 = t36 .* t40;
t42 = x_m + xi_1;
t44 = C .* t42 .* t21;
t45 = -i .* t28;
t47 = 2.*i .* D_LE .* y_m;
t48 = -i .* t31;
t49 = -i .* t32;
t51 = -i .* xi_1;
t53 = 0.1e1 ./ (t5 + i .* x_m + t51);
t55 = log(t53 .* (t34 .* t17 + (t5 .* (-t36 + t37 + x_m - xi_1)) + t41 + i .* t44 + t45 + t47 + t48 + t49));
t56 = (xi_3 .^ 2);
t62 = 2 .* x_m .* xi_3;
t64 = sqrt((-2 .* C .* t21 .* xi_3 + t56 .* t18 + t25 + t28 - t30 + t31 + t32 + t56 - t62));
t66 = t18 .* xi_3;
t69 = -i .* xi_3;
t71 = t18 .* x_m .* t69;
t72 = x_m + xi_3;
t74 = C .* t72 .* t21;
t77 = 0.1e1 ./ (t5 + i .* x_m + t69);
t79 = log(t77 .* (t64 .* t17 + (t5 .* (-t66 + t37 + x_m - xi_3)) + t71 + i .* t74 + t45 + t47 + t48 + t49));
t80 = t55 - t79;
t81 = i .* t5 - x_m;
t86 = sqrt(2.*i .* t6 .* t3 + t14);
t88 = i .* t5 + x_m;
t90 = -i .* t86;
t93 = -C .* t21;
t98 = 0.1e1 ./ (i .* x_m + t51 - t5);
t100 = log(t98 .* (t34 .* t90 + (t5 .* (t36 + t93 - x_m + xi_1)) + t41 + i .* t44 + t45 + t47 + t48 + t49));
t106 = 0.1e1 ./ (i .* x_m + t69 - t5);
t108 = log(t106 .* (t64 .* t90 + (t5 .* (t66 + t93 - x_m + xi_3)) + t71 + i .* t74 + t45 + t47 + t48 + t49));
t109 = t100 - t108;
t113 = 0.1e1 ./ t86;
t114 = 0.1e1 ./ t16;
t116 = 1 ./ t5;
t117 = t116 .* t114 .* t113;
t123 = t109 .* t16 - t86 .* t80;
t128 = E .* x_m + D_TE - y_m;
t130 = t5 .* E;
t136 = (E .* t8 + D_TE - y_m) .* (E .* t11 + D_TE - y_m);
t138 = sqrt(2.*i .* t130 .* t128 + t136);
t139 = -i .* t138;
t140 = E .^ 2;
t142 = y_m - D_TE;
t147 = 2 .* D_TE .* y_m;
t148 = D_TE .^ 2;
t150 = sqrt((-2 .* E .* t142 .* xi_3 + t56 .* t140 - t147 + t148 + t25 + t28 + t31 + t56 - t62));
t152 = xi_3 .* t140;
t154 = -E .* t142;
t157 = t152 .* t40;
t159 = E .* t72 .* t142;
t161 = -i .* (t148 - t147 + t28 + t31);
t164 = log(t106 .* (t150 .* t139 + (t5 .* (t152 + t154 + xi_3 - x_m)) + t157 + i .* t159 + t161));
t168 = sqrt(-2.*i .* t130 .* t128 + t136);
t175 = sqrt((-2 .* E .* t142 .* xi_1 + t19 .* t140 - t147 + t148 + t19 + t25 - t27 + t28 + t31));
t177 = xi_1 .* t140;
t180 = t177 .* t40;
t182 = E .* t42 .* t142;
t185 = log(t98 .* (t175 .* t139 + (t5 .* (t177 + t154 + xi_1 - x_m)) + t180 + i .* t182 + t161));
t187 = -i .* t168;
t189 = E .* t142;
t192 = -i .* t148;
t194 = 2.*i .* D_TE .* y_m;
t197 = log(t77 .* (t150 .* t187 + (t5 .* (-t152 + t189 - xi_3 + x_m)) + t157 + i .* t159 + t192 + t194 + t45 + t48));
t203 = log(t53 .* (t175 .* t187 + (t5 .* (-t177 + t189 - xi_1 + x_m)) + t180 + i .* t182 + t192 + t194 + t45 + t48));
t204 = t197 - t203;
t206 = -t204 .* t138 + t168 .* t164 - t168 .* t185;
t208 = 0.1e1 ./ t138;
t209 = 0.1e1 ./ t168;
t211 = t116 .* t209 .* t208;
t214 = t88 .* t168;
J_1 = 0.1e1 ./ 0.2e1.*i .* t117 .* (t109 .* t88 .* t16 + t86 .* t81 .* t80) .* C + 0.1e1 ./ 0.2e1.*i .* t117 .* t123 .* D_LE + 0.1e1 ./ 0.2e1.*i .* t211 .* t206 .* D_TE + 0.1e1 ./ 0.2e1.*i .* t211 .* (t204 .* t81 .* t138 + t164 .* t214 - t185 .* t214) .* E + -0.1e1 ./ 0.2e1.*i .* y_m .* t116 .* t114 .* t113 .* t123 + -0.1e1 ./ 0.2e1.*i .* y_m .* t116 .* t209 .* t208 .* t206;
end