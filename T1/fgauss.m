function x = fgauss(A,b)
         n = length(A);
         A = [A b];
         cont = 0;
         for k = 1 : n - 1
             for i = k + 1 : n
                 aux = A(i,k) / A(k,k);
                cont++;
                for j = k+1 : n+1
                    A(i,j) = A(i,j) - aux*A(k,j);
                    cont += 2;
                end
                A(i,k) = 0;
            end
        end
        
        x(n) = A(n,n+1) / A(n,n);
        cont++;
        for i = n - 1:-1:1
            soma = 0 ;
            for j = i+1:n
                soma +=A(i,j)*x(j);
                cont+=2;
            end
            x(i) = (A(i,n+1)-soma)/A(i,i);
            cont+=2;
        end
        
        Primeira_Incognita = x(1)
        Ultima_Incognita = x(n)
        Numero_De_Operacoes_Em_Ponto_Flutuante = cont
    
    end
	 	  	 	     	   	      	     	   	  	       	 	
