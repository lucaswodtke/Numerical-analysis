function x = fsolucaoLUcrout(A,b)

    
    [A b] = decomp_lu_crout(A,b);
    
    for j = 1 : size(b,2)
        x(:,j) = fcalculaCx(A,b(:,j));
    end
end