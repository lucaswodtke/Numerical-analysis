     function xFinal = fNewton(xi)
     
     k=0; deltaX=1.;
         while abs(deltaX) > 1e-14 && k<25
         k = k + 1;
         
            deltaX = -f(xi) / df(xi);
             
            xFinal = xi + deltaX;
           
           xi = xFinal;
            
        end
        k;
        deltaX;
    end
