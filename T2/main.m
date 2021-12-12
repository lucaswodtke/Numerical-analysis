     %f(x) = x*x*x-exp(x)
     %Pn =a=[+1 -7  +20.95 -34.75 +34.5004 -20.5012 +6.7512 -0.9504  0  0  0] %CORRETO a(1)=+1
     
     %Questao 1)
     xi = detXi();
     
     for i = 1 : length(xi)
         x(i) = fNewton(xi(i));
         residuos(i) = f(x(i));
    end
    printf("1) Zeros da funcao f(x) = x*x*x-exp(x) :  \n \n")
    
    x = transpose (x)
    
    %Questao 2)
    
    A = [1 -7  20.95 -34.75 34.5004 -20.5012 6.7512 -0.9504  0  0  0];
    n = 10;
    %Retira a raiz nula
    x(1) = 0;
    [n b r] = FBriotRuffini(n, A, 0);

    
    %Questao 2 a)
    
    printf("\n2)a) Raizes Obtidas com Newton tradicional:  \n\n")
    x = fRaizesTrad(A)
    
    %Questao 2 b)
    
    printf("\n2)b)  Raizes Obtidas estimando multiplicidade :\n\n")
    x = fRaizes(A)
    
    %Questao 2 c)
    
    printf("\n2)c) Polinomio Fatorado: \n\n")
    for i = 1 : 10
        printf("(x - %d) ", -x(i))
    end
    
    %Questao 2 d)
    
    printf("\n\n2)d)\n\n Raizes pelo roots:\n\n")
    roots = roots(A)
    
    
    printf("\n Raizes pelo Wolfram Alpha:\n\n")
    printf ("0\n")
    printf ("0.8\n")
    printf ("0.9\n")
    printf ("1.00019\n")
    printf ("1.1\n")
   printf ("0.999907 - 0.000160622 i\n")
    printf( "0.999907 + 0.000160622 i")

    %Questao 3
    
    printf("\n\n Questao 3: \n\n")
    
    xi=[1;1]
    n = length(xi);

    x1 = fNewtonSistemaFa(n, xi)
    r_max1 = max(abs(Fa(x1)))

    x2 = fNewtonSistemaF2(xi)
    r_max2 = max(abs([f1(x2), f2(x2)]))
    
    printf("\n\n Existe alguma coisa bem estranha nos meus resultados,alguma etapa está gerando numeros esquisitos,mas nao consegui identificar aonde \n\n")
    