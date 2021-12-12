     function x = fRaizes(a)
     
             n = length(a) -1 ;
             a = a(2 : n + 1)./a(1);
             a = [1 a];
     
             i = 1;
             
         while(n > 0)
    
            xi = fLocalizacaoPn(n, a);
     
            [M(i) x(i)] = FuncaoNewtonPn(xi, n, a);
    
            for j = 1 : M(i)
                [n, a, r] = FBriotRuffini(n, a, x(i));    # Reduzindo o grau de n para n - 1:
            end
    
            x(i + 1 : i + M(i) - 1) = x(i);
            i = i + M(i);
        end
           
        x = transpose(x); 
    end
