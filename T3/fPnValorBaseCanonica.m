 function y = fPnValorBaseCanonica(xp, grau, a)
         tamanho = length(a);
         for i = (tamanho + 1) : grau + 1
             a(i) = 0;
         end
         for k = 1 : length(xp)
             y(k) = a(1);
             xa = 1;
             for i = 2 : grau+1
                xa = xa*xp(k);
                y(k) += a(i)*xa;
            end
        end
    end