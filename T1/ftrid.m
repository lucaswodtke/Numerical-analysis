function x=ftrid(n,r,t,d,b)
cont = 0;
%Escalonamento:
	for i=2:n
		aux=t(i)/r(i-1);
		r(i)=r(i)-aux*d(i-1);
		b(i)=b(i)-aux*b(i-1);
		t(i)=0;  %opcional
		cont += 5;
	end
%Retrosubstituicoes:
	x(n)=b(n)/r(n);
	cont++;
	for i=n-1:-1:1
		x(i)=(b(i)-d(i)*x(i+1))/r(i);
		cont++;
		cont++;
		cont++;
	end
	Primeira_Incognita = x(1)
    Ultima_Incognita = x(n)
    Numero_De_Operacoes_Em_Ponto_Flutuante = cont
end