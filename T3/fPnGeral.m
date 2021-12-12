 function yp = fPnGeral(grau, x, y, xp)
     
     %Coeficintes da base canônica
         ordem = grau+1;
         A(1 : ordem, 1) = 1;
         % Pode ser removida se j iniciar em 1 no loop
         % A(1 : ordem, 2) = x;
         for j = 1 : grau
             A(1: ordem, j+1) = A(1:ordem, j) .* transpose(x);
        end 
        % A
        a = A \ transpose(y);
    
    % Cálculo do Valor do polinomio escrito na base canônica (usando os Coeficientes calculados via sistema)
        for k = 1 : length(xp)
            yp(k) = fPnValorBaseCanonica(xp(k), grau, a);
        end
    end