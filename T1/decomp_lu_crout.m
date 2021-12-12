function [ A b ] = decomp_lu_crout(A,b)
    n = size(A,1);  %Numero de linhas de A

    %Calcula da matrix L -> armazenada em A
    for k = 1 : n 
        for i = k : n
            sum = 0;
            for r = 1 : k-1
                sum += A(i,r) * A(r,k);
            end
            A(i,k) = A(i,k) - sum;
        end
        
        [ A b ] = ftrocalinhasLUCrout (k,A,b);
    
    %Calcula da matrix U -> armazenada em A também, sobrepostas
            for j = k+1 : n
            sum = 0;
            for r = 1 : k-1
               sum += A(k,r) * A(r,j);
            end
            A(k,j) = ( A(k,j) - sum ) / A(k,k);
        end
    end
    
    %Matriz A armazena L e U, sobrepostos
end	 	  	  	  		     	   		  	 	
