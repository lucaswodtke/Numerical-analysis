    function M = DefineMultiplicidade(r)
         
         tamanhoR = length(r);
         
         M = 1;
         
         somaDeRestos = abs(r(1)) + abs(r(2));
         
         LIMITE = 0.0001;
        
        while(somaDeRestos < LIMITE)
            M = M + 1;
            somaDeRestos += abs(r(M+1));
        end
    
    end
