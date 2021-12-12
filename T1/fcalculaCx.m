function x = fcalculaCx(A,b)
   n = size(A, 1);
   
   % LU*x = b
   
   % L*C = b
   C(1) = b(1)/A(1,1);
   for i=2: n
     somatorio = sum(A(i,1:i-1).*C(1:i-1));
     C(i) = (b(i) - somatorio) / A(i,i);
   end
   
   % U*x = C
   x(n) = C(n);
   for i=n-1:-1:1
     somatorio = sum(A(i,i+1:n).*x(i+1:n));
     x(i) = C(i) - somatorio;
   end
   
end