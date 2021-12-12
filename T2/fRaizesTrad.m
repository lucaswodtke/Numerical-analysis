     function x = fRaizesTrad(a)
     
             n = length(a) -1 ;
             a = a(2 : n + 1)./a(1);
             a = [1 a];
     
             i = 1;
             
         while(n > 0)
    
            xi = fLocalizacaoPn(n, a);
     
            x(i) = fNewtonPnTrad(xi, n, a);
    
            [n, a, r] = FBriotRuffini(n, a, x(i));    # Reduzindo o grau de n para n - 1:
           
            i = i + 1;
        end
           
        x = transpose(x); 
    end
