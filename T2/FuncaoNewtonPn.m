     function [M x] = FuncaoNewtonPn(xi, n, a)
         
         nOriginal = n;
         aOriginal = a;
         
         dx = 1;
         k = 0;
         tolerancia = 1e-14;
         
        while(abs(dx) > tolerancia && k < 100) 
            k = k + 1;
            
            n = nOriginal;
            a = aOriginal;
            
            for i = 1 : nOriginal 
                [n, a, r(i)] = FBriotRuffini(n, a, xi);
            end
           
            r(nOriginal + 1) = 1;
           
            restos = r;
        
            
            M = DefineMultiplicidade(r);
            
            dx = - r(M) / (M * r(M + 1));
            
            x = xi + dx;
            
            xi = x;
            
        end
    end	 