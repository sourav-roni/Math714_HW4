function u_star = Godunov_fluxEFix(u_l, u_r)
    if u_l >= 0  
        if u_r >= 0
            u_star = u_l;
            return 
        end
    end
    if u_l <= 0
        if u_r <= 0
            u_star = u_r;
            return
        end
    end
    if u_l >= 0
        if u_r <= 0
            val = 0.5*(u_l+u_r);
            if val>0
                u_star = u_l;
                return
            elseif val<0
                u_star = u_r;
                return
            end
        end
    end
    % Fix for transonic rarefaction wave
    if u_l < 0
        if u_r > 0
            u_star = 0.0;
            return
        end
    end
end