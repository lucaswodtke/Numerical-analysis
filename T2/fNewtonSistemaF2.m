% Calcular as raízes pelo método de Newton com derivada numérica
% dfi/dxj = (Fa(xi(1) + ... +  x(j) + dx(j) +...+ xi(n) + Fa(xi(1)+ ... + xi(n))))/dx(j)

function x = fNewtonSistemaF2(xi)
    tolerance = 1e-12;
    for i = 1 : 2 
        dx(i) = 2 * tolerance;
    end
    
    dx = transpose(dx);
    
    k = 0;
    while max(abs(dx)) > tolerance && k < 50
        k++;
        A(1, 1) = (f1([xi(1) + dx(1), xi(2)        ]) - f1([xi(1), xi(2)]))/dx(1);
        A(1, 2) = (f1([xi(1)        , xi(2) + dx(2)]) - f1([xi(1), xi(2)]))/dx(2);
        A(2, 1) = (f2([xi(1) + dx(1), xi(2)        ]) - f2([xi(1), xi(2)]))/dx(1);
        A(2, 2) = (f2([xi(1)        , xi(2) + dx(2)]) - f2([xi(1), xi(2)]))/dx(2);

        B(1, 1) = - f1(xi);
        B(2, 1) = - f2(xi);
        % B = transpose(B);
        
        dx = A \ B;
        x = xi + dx;
        xi = x;
        
    end
end	 	  	  	  		     	   		  	 	
