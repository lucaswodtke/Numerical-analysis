function x = GaussSeidel(n,A,b)
i = 1;
lambda = 1.1
    for a = 1:n
        x(a) = 0;
    end
op = 0;
cont = 1;
k = 0;
    while cont > 10e-4 && k < 50
        k++;
        aux = x;
        
        x(1) = (1-lambda) * aux(1) + lambda * (b(1) - x(2))/A(1,1);
        op+=4;
        for i = 2 : n/2
            x(i) = x(i) = (1-lambda) * aux(i) + lambda *  (b(i) - A(i,i - 1) * x(i - 1) - A(i,i + 1) * x (i + 1)   )/A(i,i);
            op+=7;
        end
        
        for i = (n/2) + 1 : n - 1
            x(i) = x(i) = (1-lambda) * aux(i) + lambda *  (b(i) - A(i,i - 1) * x(i-1) - A(i,i + 1) * x(i + 1)) / A(i,i);
            op+=7;
        end
        x(n) = x(n) = (1-lambda) * aux(n) + lambda *  (b(n) - A(n,n-1) * x(n-1))/ A(n,n);
        op+=6;
        cont = max(abs (x - aux));
    end
    Primeira_Incognita = x(1)
    Ultima_Incognita = x(n)
    Numero_De_Operacoes_Em_Ponto_Flutuante = op
    interações = k
end	 	  	 	     	   	      	     	   	  	       	 	
