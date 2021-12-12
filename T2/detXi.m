     function x = detXi()
         A = 0;
         B = 6 * pi;
         h = 0.0001;
         a = A;
         b = h + a;
         i = 1;
         
         while i < 6 && a < B
            fa = f(a);
            fb = f(b);
            if ((f(a) * f(b)) < 0) && (abs(fa - fb) < 10)
                x(i) = (a + b) * 0.5;
                i ++;
            end
        
        
        
        
            a = b;
            b = a + h;
        end
    
    
    
    
    end
