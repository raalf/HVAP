function J_3 = fcnJ_3(x_m, y_m, z_m, xi_1, xi_3, C, D_LE, E, D_TE)
t3 = (C .* x_m + D_LE - y_m);
t5 = abs(z_m);
t6 = t5 .* C;
t8 = x_m + z_m;
t11 = x_m - z_m;
t14 = (C .* t11 + D_LE - y_m) .* (C .* t8 + D_LE - y_m);
t16 = sqrt(-2.*i .* t6 .* t3 + t14);
t17 = C .^ 2;
t18 = t17 + 1;
t19 = sqrt(t18);
t20 = t19 .* t18;
t21 = t20 .* t16;
t22 = x_m .^ 2;
t23 = t5 .* t22;
t24 = t5 .^ 2;
t26 = -0.1e1 ./ 0.3e1.*i .* t5 .* t24;
t28 = (x_m .* t22) ./ 0.3e1;
t29 = z_m .^ 2;
t30 = t29 .* x_m;
t31 = i .* t23 + t26 + t28 - t30;
t35 = sqrt(2.*i .* t6 .* t3 + t14);
t36 = -i .* t35;
t37 = (xi_3 .^ 2);
t39 = y_m - D_LE;
t43 = x_m .* xi_3;
t44 = 2 .* t43;
t45 = y_m .^ 2;
t47 = 2 .* D_LE .* y_m;
t48 = D_LE .^ 2;
t50 = sqrt((-2 .* C .* t39 .* xi_3 + t37 .* t17 + t22 + t29 + t37 - t44 + t45 - t47 + t48));
t52 = xi_3 .* t17;
t54 = -C .* t39;
t58 = -i .* t43 .* t17;
t59 = x_m + xi_3;
t61 = C .* t59 .* t39;
t62 = -i .* t45;
t64 = 2.*i .* D_LE .* y_m;
t65 = -i .* t29;
t66 = -i .* t48;
t68 = -i .* xi_3;
t70 = 0.1e1 ./ (-t5 + i .* x_m + t68);
t72 = log(t70 .* (t50 .* t36 + (t5 .* (t52 + t54 - x_m + xi_3)) + t58 + i .* t61 + t62 + t64 + t65 + t66));
t75 = (xi_1 .^ 2);
t81 = 2 .* x_m .* xi_1;
t83 = sqrt((-2 .* C .* t39 .* xi_1 + t75 .* t17 + t22 + t29 + t45 - t47 + t48 + t75 - t81));
t85 = xi_1 .* t17;
t88 = -i .* x_m;
t89 = t85 .* t88;
t90 = x_m + xi_1;
t92 = C .* t90 .* t39;
t94 = -i .* xi_1;
t96 = 0.1e1 ./ (-t5 + i .* x_m + t94);
t98 = log(t96 .* (t83 .* t36 + (t5 .* (t85 + t54 - x_m + xi_1)) + t89 + i .* t92 + t62 + t64 + t65 + t66));
t101 = i .* t23 + t26 - t28 + t30;
t102 = t101 .* t20;
t103 = -i .* t16;
t105 = C .* t39;
t110 = 0.1e1 ./ (t5 + i .* x_m + t68);
t112 = log(t110 .* (t50 .* t103 + (t5 .* (-t52 + t105 + x_m - xi_3)) + t58 + i .* t61 + t62 + t64 + t65 + t66));
t119 = 0.1e1 ./ (t5 + i .* x_m + t94);
t121 = log(t119 .* (t83 .* t103 + (t5 .* (-t85 + t105 + x_m - xi_1)) + t89 + i .* t92 + t62 + t64 + t65 + t66));
t123 = t17 + 0.3e1 ./ 0.2e1;
t125 = t105 ./ 0.2e1;
t129 = log(t19 .* t83 + t54 + t85 - x_m + xi_1);
t136 = log(t19 .* t50 + t52 + t54 - x_m + xi_3);
t149 = 0.1e1 ./ t16;
t150 = 0.1e1 ./ t35;
t151 = t150 .* t149;
t153 = 1 ./ t5;
t162 = t5 .* x_m;
t163 = t22 ./ 0.2e1;
t164 = t29 ./ 0.2e1;
t165 = i .* t162 + t163 - t164;
t172 = i .* t162 - t163 + t164;
t175 = t16 .* (i .* t35 .* t5 .* (t129 - t136) + t19 .* t165 .* (t72 - t98)) + t172 .* t19 .* t35 .* (t112 - t121);
t178 = t153 ./ t19;
t184 = t5 .* (E .* x_m + D_TE - y_m);
t190 = (E .* t8 + D_TE - y_m) .* (E .* t11 + D_TE - y_m);
t192 = sqrt(-2.*i .* t184 .* E + t190);
t193 = 0.1e1 ./ t192;
t198 = sqrt(2.*i .* t184 .* E + t190);
t199 = 0.1e1 ./ t198;
t201 = E .^ 2;
t202 = t201 + 1;
t203 = sqrt(t202);
t204 = t203 .* t198;
t205 = -i .* t192;
t207 = y_m - D_TE;
t212 = 2 .* D_TE .* y_m;
t213 = D_TE .^ 2;
t215 = sqrt((-2 .* E .* t207 .* xi_1 + t75 .* t201 - t212 + t213 + t22 + t29 + t45 + t75 - t81));
t217 = xi_1 .* t201;
t218 = E .* t207;
t221 = t217 .* t88;
t223 = E .* t207 .* t90;
t224 = -i .* t213;
t226 = 2.*i .* D_TE .* y_m;
t229 = log(t119 .* (t215 .* t205 + (t5 .* (-t217 + t218 - xi_1 + x_m)) + t221 + i .* t223 + t224 + t226 + t62 + t65));
t237 = sqrt((-2 .* E .* t207 .* xi_3 + t37 .* t201 - t212 + t213 + t22 + t29 + t37 - t44 + t45));
t239 = xi_3 .* t201;
t243 = t201 .* x_m .* t68;
t245 = E .* t207 .* t59;
t248 = log(t110 .* (t237 .* t205 + (t5 .* (-t239 + t218 - xi_3 + x_m)) + t243 + i .* t245 + t224 + t226 + t62 + t65));
t253 = -E .* t207;
t255 = log(t203 .* t215 + t217 + t253 - x_m + xi_1);
t258 = log(t203 .* t237 + t239 + t253 - x_m + xi_3);
t262 = -i .* t198;
t267 = -i .* (t213 - t212 + t45 + t29);
t270 = log(t70 .* (t237 .* t262 + (t5 .* (t239 + t253 - x_m + xi_3)) + t243 + i .* t245 + t267));
t276 = log(t96 .* (t215 .* t262 + (t5 .* (t217 + t253 - x_m + xi_1)) + t221 + i .* t223 + t267));
t284 = 0.1e1 ./ t203 .* (-t229 .* t172 .* t204 + t248 .* t172 .* t204 + (i .* t198 .* t5 .* (t255 - t258) + t165 .* (t270 - t276) .* t203) .* t192);
t289 = t203 .* t202;
t290 = t289 .* t192;
t295 = t289 .* t101;
t299 = t201 + 0.3e1 ./ 0.2e1;
t301 = t218 ./ 0.2e1;
J_3 = -0.3e1 ./ 0.2e1.*i .* t153 ./ t20 .* t151 .* (t72 .* t31 .* t21 - t98 .* t31 .* t21 + (t112 .* t102 - t121 .* t102 + 0.4e1 ./ 0.3e1.*i .* t5 .* t16 .* (t129 .* (x_m .* t123 + t125) + t136 .* (-x_m .* t123 - t125) + (t83 - t50) .* t19 ./ 0.2e1)) .* t35) .* C + -i .* t178 .* t151 .* t175 .* D_LE + i .* t153 .* t284 .* t199 .* t193 .* D_TE + -0.3e1 ./ 0.2e1.*i .* t153 ./ t289 .* t199 .* (t276 .* t31 .* t290 - t270 .* t31 .* t290 + t198 .* (t229 .* t295 - t248 .* t295 + -0.4e1 ./ 0.3e1.*i .* t5 .* (t255 .* (x_m .* t299 + t301) + t258 .* (-x_m .* t299 - t301) + (t215 - t237) .* t203 ./ 0.2e1) .* t192)) .* t193 .* E + i .* y_m .* t178 .* t150 .* t149 .* t175 + -i .* y_m .* t153 .* t284 .* t199 .* t193;
end