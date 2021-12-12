function x = nResiduo(A,b,x)
     n = length(A);
    for i = 1 : n
        r(i) = abs(sum(A(i,:)*x(:)) - b(i));
    end
     x = max (r);
end