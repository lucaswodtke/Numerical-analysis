#Crição da matriz
n = 50;

A(1,1) = 1;
A(1,2) = 1;

b(1) = 1.5;

for i = 2 : n / 2
    A(i,i - 1) = 1;
    A(i, i) = 4;
    A(i,i + 1) = 1;
    b(i) = 1;
end

for i = (n / 2) + 1 : (n - 1)
    A(i, i - 1) = 1;
    A(i,i) = 5;
    A(i,i + 1) = 1;
    b(i) = 2;
end

A(n,n - 1) = 1;
A(n,n) = 1;
b(n) = 3;
b = transpose(b);
#Termino da Criação da matriz

#Resolução por metodo direto
printf("\nSolução Direta: \n\n")
x = fgauss(A, b);
residuo = nResiduo(A, b, x)
#Fim metodo direto



#Resolução por meio de vetores
#Criação Vetores t,r,d
for i = 2 : n
    t(i) = 1;
end

for i = 1 : (n - 1)
    d(i) = 1;
end

r (1) = 1;
r (n) = 1;
for i = 2 : (n/2)
    r(i) = 4;
end

for i = (n/2) + 1 : n-1
    r(i) = 5;
end
b1 = transpose(b);
#Fim criação vetores
printf("\nSolução Direta Otimizada: \n\n")
x = ftrid(n,r,t,d,b1);
residuo_direta = nResiduo(A, b, x)
#Fim metodo vetores


#Resolução por metodo Iterativo
printf("\n Solução Iterativa: \n\n")
Diagonal_Dominante = convergencia(A);
x = GaussSeidel(n,A,b);
xDobro = GaussSeidelDobro(n, A, b);
residuo_Iterativo = nResiduo(A, b, x)
erro_de_Truncamento_max = max(abs(x - xDobro))
#Fim metodo iterativo

#Resolução por metodo direto LU Crout
printf("\nSolução Direta por LU CROUT: \n\n")
x = fsolucaoLUcrout(A,b)
for j = 1 : ns
    rmax(j) = fresiduomaximo(A,b(:,j), x(:,j));
end
rmax
#Fim metodo metodo direto LU Crout
 	 	  	 	     	   	      	     	   	  	       	 	
