     function [n, b, r] = FBriotRuffini(n, a, xi)
     
         b(1) = a(1);
         
         for i = 2 : n + 1
             b(i) = a(i) + xi * b(i - 1);
         end
         
         r = b(n + 1);
        b = b(1 : n);
        n = n - 1;
    
    end
