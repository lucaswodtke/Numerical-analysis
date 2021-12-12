 function x = convergencia(A)
    n = length(A);
         x = true;
         for i = 1 : n
             soma = 0;
             for j = 1 : n
                 if i != j
                     soma += A(i,j);
                 end
            end
            if soma > A(i,i)
                x = false;
            end
            if A(i,i) > soma && x
                pode = true;
            end
        end
        
        if !(pode && x)
            x = false;
        end
        
        if x
            printf("Tem convergencia Garantida? : SIM \n")
        else
            printf("Tem convergencia Garantida? : NAO \n")
        end
    end	 	  	 	     	   	      	     	   	  	       	 	
