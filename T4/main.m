format long
printf("\n ------------------------QUESTAO 1------------------------------- \n");
x = [ 1.0 2.1  3.0 3.9 5.0 6.0  7.2 8.1  9.2 10.4];
%y = fgx1([1; 1; 1; 1; 1; 1; 1;], x)
y = [ 1.5 0.1 -0.4 0.2 1.7 2.2 1.6  0.4 -0.4  0.5 ];

printf("\n ------------------------AJUSTE POLINOMIAL------------------------------- \n");
% ajuste polinomial
n = 5
a = fCalculaCoefAjustePn(x, y, n);
%a = fliplr(polyfit(x, y, n));
xp = min(x):0.01:max(x);
yp = fPn(n, a, xp);
DesvioModuloPn = sum(abs(fPn(n, a, x).-y))/length(x)

printf("\n ------------------------AJUSTE SENO-COS COM 7 COEF----------------------------- \n");
printf("\n ajuste para g(x) = a(1).*sen(a(2).+a(3).*x).+a(4).*cos(a(5).+a(6).*x).+a(7) \n");
%ajuste para g(x) = a(1).*sen(a(2).+a(3).*x).+a(4).*cos(a(5).+a(6).*x).+a(7)
a2 = fCalculaCoefAjustegx1(x, y);
yp2 = fgx1(a2, xp);
DesvioModulogx1 = sum(abs(fgx1(a2, x).-y))/length(x)

printf("\n ------------------------AJUSTE SENO-COS COM 2 COEF----------------------------- \n");
printf("\n ajuste para g(x) =  a(1).*sin(x) .+ a(2).*cos(x); \n");
%ajuste para g(x) =  a(1).*sin(xp) .+ a(2).*cos(xp);
a3 = fCalculaCoefAjustegx3(x, y);
yp3 = fgx3(a3, xp);
DesvioModulogx3 = sum(abs(fgx3(a3, x).-y))/length(x)
plot(xp, yp,'-r', x, y, '*', xp, yp2, '-b', xp, yp3, '-k', 16, 0);

printf("\n ------------------------CONCLUSAO----------------------------- \n");
printf("\n Os m pontos do Grafico seguem uma tendencia,que caracteriza o seu comportamento. Nesses casos,")
printf(" e preferivel escolher uma funcao que represente essa tendencia em vez de tentar forcar que uma funcao interpoladora passe sobre todos")
printf(" os m pontos que genericamente podem nem ser uma funcao,")
printf(" a funcao  a(1).*sin(x) .+ a(2).*cos(x) e muita simplista,por isso usando mais coeficientes obtemos uma funcao aproximadora que demonstra esse comportamento no caso é a")
printf(" a(1).*sen(a(2).+a(3).*x).+a(4).*cos(a(5).+a(6).*x).+a(7),a funcao polinomial com grau muito elevado cria distorções,")
printf("com grau 5 encontramos uma aproximação com grau adequado,porem passa por alguns pontos exatos como temos poucos pontos de amostragem,isso não levaem conta o erro da própria amostragem,")
printf("por isso considero a aproximacao seno cos com 7 cieficientes a melhor \n");

printf("\n ------------------------QUESTAO 2------------------------------- \n");

x=1
a=0;
b=x;
f =@(x) exp(-x.*x);
Ie=erf(x);
auxiliar=2/sqrt(pi);
printf("\n -------------------------------------------------------------------- \n");

printf("\n TRAPEZIO \n");
%metodo trapezio
n=2^12
Tn= auxiliar.*fIntegralTrapezios(n,a,b,f)
ErroExato= abs(Tn-Ie)
erroExatoEstimado=abs(Tn -auxiliar.*fIntegralTrapezios(2*n,a,b,f))
diferencaDosErros = abs(ErroExato-erroExatoEstimado)
printf("\n -------------------------------------------------------------------- \n");

printf("\n SIMPSON \n");
%metodo simpson
n=2^12
Sn= auxiliar.*fIntegralSimpson(n,a,b,f)
ErroExatoSn= abs(Sn-Ie)
erroExatoEstimadoSn=abs(Sn -auxiliar.*fIntegralSimpson(2*n,a,b,f))
diferencaDosErrosSn = abs(ErroExatoSn-erroExatoEstimadoSn)
printf("\n -------------------------------------------------------------------- \n");

printf("\n GAUSS-LEGENDRE \n");
%metodo gauss-legendre

%numero de pontos
m=8

Gm= auxiliar.*fIntegralGauss(m,a,b,f)
ErroExatoGm= abs(Gm-Ie)
erroExatoEstimadoGm=abs(Gm -auxiliar.*fIntegralGauss(m+1,a,b,f))
diferencaDosErrosGm = abs(ErroExatoGm-erroExatoEstimadoGm)

fm=factorial(2*m)/(2**(2*m+1));
ErroExatoEstimado = (b-a)**(2*m-1)*(factorial(m)**4/((2*m+1)*(factorial(2*m))**3))*fm

printf("\n -------------------------------------------------------------------- \n");

printf("\n ------------------------CONCLUSAO------------------------------- \n");
printf("\n Observando a expressão do erro de Gauss-Legendre, comparado com o erro do método de Simpson e Trapezios para o mesmo número de chamadas da função, notamos que Gauss é mais preciso,e o Trapezio o menos preciso. \n");