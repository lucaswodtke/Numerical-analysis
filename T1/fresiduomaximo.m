function rmax = fresiduomaximo(A,b,x)
    N = size(A,1);

    for i=1:N
        somatorio = sum(A(i, 1:N) .* transpose(x(1:N)));
        R(i) = abs(somatorio-b(i));
    end
    
    rmax = max(R);
end